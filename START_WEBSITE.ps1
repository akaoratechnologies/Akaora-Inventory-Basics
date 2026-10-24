# Akaora Inventory Basics - a local-only HTTP server for bundled index.html.
# No third-party dependencies or administrative privileges needed.
$ErrorActionPreference = 'Stop'
$port = 8767
$folder = Split-Path -Parent $MyInvocation.MyCommand.Path
$file = Join-Path $folder 'index.html'
$server = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
try {
  $server.Start()
  Write-Host "Akaora Inventory Basics running at http://localhost:$port/" -ForegroundColor Green
  Write-Host 'Keep this window open while using the website. Press Ctrl+C to stop.'
  Start-Process "http://localhost:$port/"
  while ($true) {
    $client = $server.AcceptTcpClient()
    try {
      $client.ReceiveTimeout = 5000
      $client.SendTimeout = 5000
      $stream = $client.GetStream()
      $reader = [System.IO.StreamReader]::new($stream, [System.Text.Encoding]::ASCII, $false, 1024, $true)
      $first = $reader.ReadLine()
      if ($null -eq $first) { continue }
      do { $line = $reader.ReadLine() } while ($null -ne $line -and $line.Length -gt 0)
      $path = ($first -split ' ')[1]
      if ($first -notmatch '^GET ' -or $path -notin @('/', '/index.html')) {
        $content = [System.Text.Encoding]::UTF8.GetBytes('Not Found')
        $status = '404 Not Found'
        $type = 'text/plain; charset=utf-8'
      } else {
        $content = [System.IO.File]::ReadAllBytes($file)
        $status = '200 OK'
        $type = 'text/html; charset=utf-8'
      }
      $headers = "HTTP/1.1 $status`r`nContent-Type: $type`r`nContent-Length: $($content.Length)`r`nCache-Control: no-store`r`nConnection: close`r`nX-Content-Type-Options: nosniff`r`n`r`n"
      $headerBytes = [System.Text.Encoding]::ASCII.GetBytes($headers)
      $stream.Write($headerBytes, 0, $headerBytes.Length)
      $stream.Write($content, 0, $content.Length)
      $stream.Flush()
    } catch { Write-Warning $_.Exception.Message }
    finally { $client.Close() }
  }
} finally { $server.Stop() }
