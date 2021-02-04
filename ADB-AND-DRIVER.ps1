if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$host.ui.RawUI.WindowTitle = 'Jef00 ADB AND DRIVER INSTALLER'

Write-Host "#########################################" -ForegroundColor Green
Write-Host "#           ADB AND DRIVER INSTALLER    #" -ForegroundColor Green
Write-Host "#########################################" -ForegroundColor Green

$t = @"
                        ++ 
 =================== ++++++
 =        ====         ++
 =          ==       
 =          ==          =
 =          ==          =
 =          ==          =
 =          ==          = 
 =          ==          =
 =        ======        = 
 ========================
"@

for ($i = 0; $i -lt $t.length; $i++) {
  if ($i % 2) {
    $c = "red"
  }
  elseif ($i % 5) {
    $c = "white"
  }
  elseif ($i % 7) {
    $c = "red"
  }
  else {
    $c = "white"
  }
  write-host $t[$i] -NoNewline -ForegroundColor $c
}


Write-Host "`n#########################################" -ForegroundColor Green
Write-Host "#           By Jeff00                   #" -ForegroundColor Green
Write-Host "#########################################" -ForegroundColor Green

function DownloadADB {
     
  # PROMPT FOR USER for download 
  ($InstallorNOT) = Read-Host "`nDo you want to install ADB and Fastboot (Reccomended)[Y/N]?"
  while ("y", "n" -notcontains $InstallorNOT ) {
    $InstallorNOT = Read-Host "`nPlease enter your response (y/n)"
  }
  if ($InstallorNOT -eq "N") {
    write-host "`nOke skipping download ADB part .."
    Pause
  }
  
  if ($InstallorNOT -eq "Y") {
    # Make sure that there is no ADB folder before downloading
    $ADBFILES = "$PSScriptRoot\ADB" 
    $ADBExists = Test-Path $ADBFILES
    if ($ADBExists -eq $true) {
      Remove-item $ADBFILES -Recurse -Force 

    }
    # Download ADB for Windows 10 
    write-host "`nOke gonna download the latest Official ADB & Fastboot files.. and extract ADB."
 
    $url = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
    $DownloadDestinationADB = "$PSScriptRoot\platform-tools-latest-windows.zip"
    $UnzipDestinationADB = "$PSScriptRoot\platform-tools-latest-windows"
    $start_time = Get-Date
           
    Import-Module BitsTransfer
    Start-BitsTransfer -Source $url -Destination $DownloadDestinationADB
    Write-Output "Download time: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    Write-Host "Gonna unzip now"
       
    # Unzip
    Expand-Archive -Path $DownloadDestinationADB -DestinationPath $UnzipDestinationADB 
       
    # Copy
    [string]$sourceDirectory = "$PSScriptRoot\platform-tools-latest-windows\platform-tools\"
    [string]$destinationDirectory = "$PSScriptRoot\ADB"
    Copy-item -Force -Recurse $sourceDirectory -Destination $destinationDirectory 
 
    # Remove ADB folder and zip
    $RemoveADBFiles = "$PSScriptRoot\platform-tools-latest-windows.zip", "$PSScriptRoot\platform-tools-latest-windows"
    Remove-Item $RemoveADBFiles -Recurse -Force
  }
 
}
       
DownloadADB
function ADBsystemwide {
  # PROMPT FOR SYSTEM-wide ADB or CURRENT DIRECTORY
  $SystemADBinstall = Read-Host "`nDo you want to install ADB System-wide Y/N (Reccomended)[Y/N]?"
  while ("y", "n" -notcontains $SystemADBinstall ) {
    $SystemADBinstall = Read-Host "`nPlease enter your response (y/n)"
  }
  if ($SystemADBinstall -eq "N") {
    write-host "You choose to not install ADB system-wide, ADB commands will only work in ($PSScriptRoot)ADB or User-wide if you have choose that option"
    Pause
  }
  if ($SystemADBinstall -eq "Y") {        
    $ADBFILES = "$PSScriptRoot\ADB" 
    $ADBExists = Test-Path $ADBFILES
    while ($ADBExists -eq $false) {
      write-host "`nADB directory is not detected in $PSScriptRoot you most select yes in the previous step to continue, or you can close the window to exit"
      DownloadADB
    }

    if ($ADBExists -eq $true) {
      write-host "`nCopy ADB files in.. $env:HOMEDRIVE\ADB"

      # Make sure that there is no ADB folder 
      $ADBinC = "$env:HOMEDRIVE\ADB" 
      $ADBExistsinC = Test-Path $ADBinC
      if ($ADBExistsinC -eq $true) {
        Remove-item $ADBinC -Recurse -Force 
      }
 
      # Copy
      [string]$sourceDirectory = "$PSScriptRoot\ADB"
      [string]$destinationDirectory = "$env:HOMEDRIVE\ADB"
      Copy-item -Force -Recurse $sourceDirectory -Destination $destinationDirectory 

      [Environment]::SetEnvironmentVariable("PATH", "$ENV:PATH;$destinationDirectory", "MACHINE")
 
      #Remove ADB folder
      $RemoveADBFiles = "$PSScriptRoot\ADB"
      Remove-Item $RemoveADBFiles -Recurse -Force
  
    } 

  }
}
     
ADBsystemwide
    
function ADBuserOnly {
  # PROMPT FOR User-wide ADB or CURRENT DIRECTORY
  $ADBuserOnly = Read-Host "`nDo you want to install ADB User-wide Y/N (Reccomended)[Y/N]?"
  while ("y", "n" -notcontains $ADBuserOnly) {
    $ADBuserOnly = Read-Host "`nPlease enter your response (y/n)"
  }
  if ($ADBuserOnly -eq "N") {
    write-host "You choose to not install ADB User-wide, ADB commands will only work in ($PSScriptRoot)ADB, or System-wide if you have choose that option"
    Pause
  }
   
    
  if ($ADBuserOnly -eq "Y") {        
    $ADBFILES = "$PSScriptRoot\ADB" 
    $ADBExists = Test-Path $ADBFILES
    while ($ADBExists -eq $false) {
      write-host "`nADB is not detected in $PSScriptRoot you most select yes in the previous step to continue, or you can close the window to exit"
      DownloadADB
    }
    
    if ($ADBExists -eq $true) {
      write-host "`nCopy ADB files in.. $env:USERPROFILE\ADB"

      # Make sure that there is no ADB folder 
      $ADBInuser = "$env:USERPROFILE\ADB"
      $ADBExistsInUser = Test-Path $ADBInuser
      if ($ADBExistsInUser -eq $true) {
        Remove-item $ADBInuser -Recurse -Force 
      }
   
      # Copy
      [string]$sourceDirectory = "$PSScriptRoot\ADB"
      [string]$destinationDirectory = "$env:USERPROFILE\ADB"
      Copy-item -Force -Recurse $sourceDirectory -Destination $destinationDirectory 

      [Environment]::SetEnvironmentVariable("PATH", "$ENV:PATH;$destinationDirectory", "USER")
      
      #Remove ADB folder
      $RemoveADBFiles = "$PSScriptRoot\ADB"
      Remove-Item $RemoveADBFiles -Recurse -Force


    }

  }
}

  
ADBuserOnly

function InstallDriver {
     
  # PROMPT FOR USER for download 
  ($InstallorNOT) = Read-Host "`nDo you want to install device drivers (Reccomended)[Y/N]?"
  while ("y", "n" -notcontains $InstallorNOT ) {
    $InstallorNOT = Read-Host "`nPlease enter your response (y/n)"
  }
  if ($InstallorNOT -eq "N") {
    write-host "`nOke skipping installing driver part .."
    Pause
  }
     
  if ($InstallorNOT -eq "Y") {
    # Make sure that there is no ADB folder 
    $Driveristhere = "$PSScriptRoot\ADBDriver\"
    $ADBDriverExists = Test-Path $Driveristhere
    if ($ADBDriverExists -eq $true) {
      Remove-item $Driveristhere -Recurse -Force         
    }
    # Download device drivers for Windows 10 
    write-host "`nOke gonna download the latest Official Driver, extract it and install the driver"
              
    $url = "https://dl.google.com/android/repository/usb_driver_r13-windows.zip"
    $DownloadDestinationdriver = "$PSScriptRoot\latest_usb_driver_windows.zip"
    $UnzipDestinationdriver = "$PSScriptRoot\latest_usb_driver_windows"
    $start_time = Get-Date
              
    Import-Module BitsTransfer
    Start-BitsTransfer -Source $url -Destination $DownloadDestinationdriver
    Write-Output "Download time: $((Get-Date).Subtract($start_time).Seconds) second(s)"
          
    # Unzip
    Expand-Archive -Path $DownloadDestinationdriver -DestinationPath $UnzipDestinationdriver
          
    # Copy
    [string]$sourceDirectoryDriver = "$PSScriptRoot\latest_usb_driver_windows\usb_driver\"
    [string]$destinationDirectoryDriver = "$PSScriptRoot\ADBDriver\"
    Copy-item -Force -Recurse $sourceDirectoryDriver -Destination $destinationDirectoryDriver 

    write-host "`nFollow the instructions on the screen to install the driver"

    pnputil.exe /i /a $destinationDirectoryDriver\android_winusb.inf

    # Remove driver directory
    $RemoveDriver = "$PSScriptRoot\latest_usb_driver_windows\" , "$PSScriptRoot\latest_usb_driver_windows.zip"
    Remove-Item $RemoveDriver -Recurse -Force

    
    
  }
}
  
InstallDriver



$t = @"
 #########################################
 #            Happy flashing!            #
 #########################################
"@

for ($i = 0; $i -lt $t.length; $i++) {
  if ($i % 2) {
    $c = "red"
  }
  elseif ($i % 5) {
    $c = "white"
  }
  elseif ($i % 7) {
    $c = "red"
  }
  else {
    $c = "white"
  }
  write-host $t[$i] -NoNewline -ForegroundColor $c
}

Write-Host "`nMy work is done here, bye"

Pause
