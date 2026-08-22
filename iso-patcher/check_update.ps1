# Read Build ID from version.txt
$buildId = Get-Content 'IKWv3\version.txt' | Select-Object -First 1 | ForEach-Object { $_.Trim() }

$url = "https://ikw.mwk.li/ikw/patcher/$buildId/update.zip"

Write-Host "Checking for updates at: $url"

try {
    $response = [System.Net.HttpWebRequest]::Create($url)
    $response.Method = 'HEAD'
    $response.AllowAutoRedirect = $false
    $response.Timeout = 10000
    
    try {
        $httpResponse = $response.GetResponse()
        $statusCode = $httpResponse.StatusCode
        $httpResponse.Close()
        
        if ($statusCode -eq 'OK' -or $statusCode -eq 200) {
            Write-Host "Update available! Downloading..."
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            (New-Object System.Net.WebClient).DownloadFile($url, 'update.zip')
            Write-Host "Download completed. Extracting..."
            
            # Extract ZIP with -Force to overwrite existing files
            try {
                Expand-Archive -Path 'update.zip' -DestinationPath '.' -Force
            } catch {
                # Fallback for older PowerShell versions
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                $zip = [System.IO.Compression.ZipFile]::OpenRead('update.zip')
                foreach ($entry in $zip.Entries) {
                    $targetPath = Join-Path '.' $entry.FullName
                    $targetDir = Split-Path $targetPath
                    if (-not (Test-Path $targetDir)) {
                        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
                    }
                    if ($entry.Name) {
                        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $targetPath, $true)
                    }
                }
                $zip.Dispose()
            }
            
            Remove-Item 'update.zip' -Force
            Write-Host "Update completed successfully!"
            exit 1
        }
    } catch [Net.WebException] {
        if ($_.Exception.Response.StatusCode -eq 'NotFound' -or $_.Exception.Response.StatusCode -eq 404) {
            Write-Host "No update available."
            exit 0
        } else {
            Write-Host "Update check failed: $($_.Exception.Status)"
            exit 0
        }
    }
} catch {
    Write-Host "Update check error: $($_.Exception.Message)"
    exit 0
}
