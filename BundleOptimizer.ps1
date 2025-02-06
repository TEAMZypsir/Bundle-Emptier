Write-Host "What is the target directory?"
$directory = Read-Host

$files = Get-ChildItem -Path $directory -Recurse -Filter "*.bundle" -File

foreach ($file in $files) {
    try {
        # Create an empty file with the same name
        New-Item -Path $file.FullName -ItemType File -Force
        Write-Output "Emptied: $($file.FullName)"
    } catch {
        Write-Output "Failed to process: $($file.FullName) - $_"
    }
}

Write-Output "Operation completed."