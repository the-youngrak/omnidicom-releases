# Runs only on a disposable CI runner. Never install over the owner's copy.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
if ($env:GITHUB_ACTIONS -ne 'true') { throw 'Run this installer check on a disposable GitHub Actions runner.' }
$out = Join-Path $env:GITHUB_WORKSPACE 'dist/winget-check'
New-Item -ItemType Directory -Force $out | Out-Null
Start-Transcript -Path (Join-Path $out 'transcript.txt')
try {
    $manifest = Join-Path $PSScriptRoot 'manifests/o/OmniDICOM/OmniDICOM/1.0.8'
    $package = Join-Path $out 'setup.exe'
    $url = 'https://github.com/the-youngrak/omnidicom-releases/releases/download/v1.0.8/OmniDICOM-1.0.8-windows-x64-setup.exe'
    Invoke-WebRequest $url -OutFile $package
    $hash = (Get-FileHash $package -Algorithm SHA256).Hash
    if ($hash -ne 'A3E6074624FB56B38956FDC3D1F6F851BCF641662CA620A14CC59F6B5A416FA1') { throw 'Published installer checksum mismatch' }
    $signature = Get-AuthenticodeSignature $package
    if ($signature.Status -ne 'Valid') { throw "Installer signature: $($signature.Status)" }
    $app = Get-AppxPackage Microsoft.DesktopAppInstaller | Sort-Object Version -Descending | Select-Object -First 1
    $winget = Join-Path $app.InstallLocation 'winget.exe'
    if (-not (Test-Path $winget)) { throw 'WinGet executable unavailable' }
    & $winget --info
    & $winget validate --manifest $manifest
    if ($LASTEXITCODE -ne 0) { throw "Manifest validation failed: $LASTEXITCODE" }
    & $winget settings --enable LocalManifestFiles
    if ($LASTEXITCODE -ne 0) { throw "Cannot enable local manifests: $LASTEXITCODE" }
    & $winget install --manifest $manifest --silent --disable-interactivity --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) { throw "Manifest installation failed: $LASTEXITCODE" }
    $key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\{7E1C2D4A-5B3F-4C8E-9A61-0F2D6B7C3E51}_is1'
    $installed = Get-ItemProperty $key
    if ($installed.DisplayName -ne 'OmniDICOM' -or $installed.DisplayVersion -ne '1.0.8' -or $installed.Publisher -ne 'OmniDICOM') { throw 'Installed metadata does not match manifest' }
    $exe = Join-Path $installed.InstallLocation 'OmniDICOM.exe'
    if ((Get-AuthenticodeSignature $exe).Status -ne 'Valid') { throw 'Installed executable signature is not valid' }
    $env:OMNIDICOM_SETTINGS_FILE = Join-Path $out 'settings.ini'
    $env:QT_QPA_PLATFORM = 'offscreen'
    $report = Join-Path $out 'runtime-checks.json'
    $runtime = Start-Process $exe -ArgumentList @('--self-test', '--self-test-report', "`"$report`"") -PassThru
    if (-not $runtime.WaitForExit(180000)) { $runtime.Kill(); throw 'Installed runtime check timed out' }
    if ($runtime.ExitCode -ne 0 -or -not (Test-Path $report)) { throw 'Installed runtime check failed' }
    & $winget uninstall --name OmniDICOM --exact --silent --disable-interactivity
    if ($LASTEXITCODE -ne 0) { throw "Uninstall failed: $LASTEXITCODE" }
    if (Test-Path $key) { throw 'Uninstaller left its Apps and Features registration' }
    if (Test-Path $exe) { throw 'Uninstaller left the application executable' }
    [ordered]@{
        package = 'OmniDICOM.OmniDICOM'; version = '1.0.8'; installer_sha256 = $hash
        installer_signature = $signature.Status.ToString(); signer = $signature.SignerCertificate.Subject
        manifest_validated = $true; silent_install = $true; runtime_check = $true; uninstall = $true
        environment = 'Disposable GitHub Actions Windows 2025 x64 runner'
    } | ConvertTo-Json | Set-Content (Join-Path $out 'result.json')
} finally {
    Stop-Transcript
    # The signed public installer remains downloadable from its release. Keep only reports.
    Remove-Item (Join-Path $out 'setup.exe') -ErrorAction SilentlyContinue
}
