# Local preview server for the website (this computer only).
# Serves the site/ folder at http://localhost:8080/ so Claude and the owner can
# preview changes before publishing. Not part of the published website.
param(
    [int]$Port = 8080,
    [string]$Root = (Join-Path (Split-Path -Parent $PSScriptRoot) 'site')
)

$Root = (Resolve-Path $Root).Path
$types = @{
    '.html' = 'text/html; charset=utf-8'; '.css' = 'text/css; charset=utf-8'
    '.js' = 'text/javascript; charset=utf-8'; '.svg' = 'image/svg+xml'
    '.png' = 'image/png'; '.jpg' = 'image/jpeg'; '.ico' = 'image/x-icon'
    '.txt' = 'text/plain; charset=utf-8'; '.xml' = 'application/xml'
    '.webmanifest' = 'application/manifest+json'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Start()
Write-Host "Previewing $Root at http://localhost:$Port/ (Ctrl+C to stop)"

try {
    while ($listener.IsListening) {
        $ctx = $listener.GetContext()
        $req = $ctx.Request; $res = $ctx.Response
        try {
            $rel = [Uri]::UnescapeDataString($req.Url.AbsolutePath).TrimStart('/') -replace '/', '\'
            $path = [IO.Path]::GetFullPath((Join-Path $Root $rel))
            if (Test-Path $path -PathType Container) { $path = Join-Path $path 'index.html' }
            $status = 200
            if (-not $path.StartsWith($Root, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path $path -PathType Leaf)) {
                $status = 404
                $bytes = [Text.Encoding]::UTF8.GetBytes('404 Not Found')
                $res.ContentType = 'text/plain; charset=utf-8'
            } else {
                $bytes = [IO.File]::ReadAllBytes($path)
                $ext = [IO.Path]::GetExtension($path).ToLower()
                $res.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { 'application/octet-stream' }
            }
            $res.StatusCode = $status
            $res.Headers.Add('Cache-Control', 'no-store')
            if ($req.HttpMethod -ne 'HEAD') {
                $res.ContentLength64 = $bytes.Length
                $res.OutputStream.Write($bytes, 0, $bytes.Length)
            }
            Write-Host ("{0} {1} {2}" -f $status, $req.HttpMethod, $req.Url.AbsolutePath)
        } catch {
            Write-Host "Request failed: $($_.Exception.Message)"
        } finally {
            $res.Close()
        }
    }
} finally {
    $listener.Stop()
}
