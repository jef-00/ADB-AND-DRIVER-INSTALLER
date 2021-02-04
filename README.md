# What is this?
This a Powershell script for Windows that will download the latest ADB from the Official repositories and install it System-wide or User-Wide, this script will also install latest Google drivers also from from the Official repositories.

# Features:
Small - 8,98 kB
<br>Fast - it take seconds to install 
<br>ADB, Fastboot and also Drivers
<br>Easy to install - just run the script and the script will guide you
<br>Clean - ADB and Google Drivers from the Official repositories.

# Install process:
0. Click on the script and choose "link save as" and save the script 
<img src="Images/Download%20script.png" width="300" >
<br>
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
System-wide: ADB and Fastboot are installed to SystemDrive\ADB directory, and added system-wide path.
Current user only: ADB and Fastboot are installed to UserProfile\ADB directory, and added path for current user.
CMD can use ADB and Fastboot from any directory.

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
