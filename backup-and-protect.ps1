# Define source and backup folder paths
$source = ".\3-Evidence"
$backup = ".\3-Evidence-Backup"

# Create backup folder if it doesn't exist
if (-not (Test-Path $backup)) {
    Copy-Item $source -Destination $backup -Recurse
}

# Set all items in backup folder to ReadOnly
Get-ChildItem -Path $backup -Recurse | ForEach-Object {
    Set-ItemProperty -Path $_.FullName -Name IsReadOnly -Value $true
}
