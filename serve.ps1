$port = 8080
$root = $PSScriptRoot
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Serving at http://localhost:$port/ -- press Ctrl+C to stop"
try {
    while ($listener.IsListening) {
        $ctx = $listener.GetContext()
        $req = $ctx.Request
        $resp = $ctx.Response
        $localPath = $req.Url.LocalPath.TrimStart('/').Replace('/', '\')
        $path = if ($localPath -eq '') { Join-Path $root 'index.html' } else { Join-Path $root $localPath }
        if (Test-Path $path -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($path)
            $ext = [System.IO.Path]::GetExtension($path).ToLower()
            $mime = @{
                '.html' = 'text/html; charset=utf-8'
                '.css'  = 'text/css'
                '.js'   = 'application/javascript'
                '.jpg'  = 'image/jpeg'
                '.jpeg' = 'image/jpeg'
                '.png'  = 'image/png'
                '.svg'  = 'image/svg+xml'
                '.ico'  = 'image/x-icon'
            }[$ext]
            if (-not $mime) { $mime = 'application/octet-stream' }
            $resp.ContentType = $mime
            $resp.ContentLength64 = $bytes.Length
            $resp.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $resp.StatusCode = 404
        }
        $resp.Close()
    }
} finally {
    $listener.Stop()
}
