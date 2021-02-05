# What is this?
This a Powershell script for Windows that will download the latest ADB from the Official repositories and install it System-wide or User-Wide, this script will also install latest Google drivers also from from the Official repositories.

# Features:
Small - 8,98 kB
<br>Fast - it take seconds to install 
<br>ADB, Fastboot and also Drivers
<br>Easy to install - just run the script and the script will guide you
<br>Clean - ADB and Google Drivers from the Official repositories.

# Install process:
Click on the script and choose "link save as" and save the script <br> 
<img src="Images/Download%20script.png" width="300" >
<br>
Right click on the script and choose "run with Powershell"
<img src="Images/Runscript.png" width="300" >
<br>
<img src="Images/Script01.png" width="300" >
<br>
<img src="Images/Script02.png" width="300" >
<br>
<img src="Images/Script03.png" width="300" >
<br>
<img src="Images/Script04.png" width="300" >
<br>

<br>1. Run the script it (Require administrator privileges)
<br>2. Press Y/Yes to install ADB and Fastboot or N/No to skip
<br>3. Press Y/Yes to install ADB system-wide or N/No for current user only
<br>4. Press Y/Yes to install Drivers or N/No to skip
<br>5. Continue Driver installation
<br>6. 15 seconds passed - finished!

# Notes:
System-wide: ADB and Fastboot are installed to HOMEDRIVE\ADB directory, and added system-wide path. <br>
HOMEDRIVE=C:\ so in case of the System-wide install option ADB will copy over to C:\ADB 
<br>
Current user only: ADB and Fastboot are installed to UserProfile\ADB directory, and added path for current user.
UserProfile=%SystemDrive%\Users\{username} so in case of the Userwide-wide install option ADB will copy over to C:\Users\username\ADB
<br>
CMD or Poweshell can use ADB and Fastboot from any directory.<br>
You can run the script from any directory unless you want to update ADB. Follow the steps from how to update if you want to update.

# Problems after driver installation?
Go to the device manager and right click on the android driver and choose update driver. <br>
<img src="Images/1.png" width="300" >
<br>

<br>Choose the second option.<br>
<img src="Images/2.png" width="300" >

<br>Choose the second option again and click "Next".<br>
<img src="Images/3.png" width="300" >

<br>Select the Android Device and click "Next".<br>
<img src="Images/5.png" width="300" >

<br>Select Android ADB Interface and click "Next".<br>
<img src="Images/6.png" width="300" >

<br>Choose "yes" and click "Next".<br>
<img src="Images/7.png" width="300" >

<br>Choose "Close" .<br>
<img src="Images/8.png" width="300" >

Now the driver will work!

# How to update?
If you want to update ADB when there is an new version of ADB. The update process depends how you install ADB, System-wide or User-Wide 
if you have installed System-wide place the script in C:\ and run the script until image blow and close the window.
When you have installed ADB User-wide place the script in %SystemDrive%\Users\{username} and run the script until image blow and close the window.<br>
<img src="Images/Script05.png" width="300" >
<br>

## How to update drivers?
Rerun the tool and choose "no" until you were ask "Do you want to install device drivers" Choose "yes"

