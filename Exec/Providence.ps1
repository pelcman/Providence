Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$width = $screen.Width
$height = $screen.Height
$left = $screen.X
$top = $screen.Y

$bitmap = New-Object System.Drawing.Bitmap $width, $height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.CopyFromScreen($left, $top, 0, 0, $bitmap.Size)

# Set date and computer name folder path
$dateFolder = Get-Date -Format "yyyy-MM-dd"
$computerName = $env:COMPUTERNAME

# ==== Read base output path from file ====
$baseOutput = Get-Content "output_path.txt" -Raw
$path = "$baseOutput\$computerName\$dateFolder"

# ==== If the folder does not exist, create it ====
if (-not (Test-Path -Path $path)) {
    New-Item -Path $path -ItemType Directory -Force
}

# Set screenshot file name
$file = Join-Path -Path $path -ChildPath ("$(Get-Date -Format HH.mm.ss).png")

# Save screenshot
$bitmap.Save($file, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()
