@echo off
title Intel RST Driver Installer
setlocal
echo Please run this batch file as an administrator.

:Start
echo.
echo [1] RAID or Intel Optane Memory H Series
echo [2] Intel Optane Memory M Series
set /p Driver="Which of the following do you need? (1/2) "
if "%Driver%"=="1" goto :Driver1
if "%Driver%"=="2" goto :Driver2
echo Invalid Syntax!
goto :Start

:Driver1
echo.
echo Please download the following driver from here then press any key to continue. ^-^-^> https://www.intel.com/content/www/us/en/download/720755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-11th-up-to-13th-gen-platforms.html
pause
goto :Done

:Driver2
echo.
echo Please download the following driver from here then press any key to continue. ^-^-^> https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html?v=t
pause
goto :Done

:Done
echo.
set /p Path="What is the path to your downloaded Intel RST driver (don't include the file name. Only include the path to the folder that the Intel RST driver is in)? "
set /p Windows="What is the drive letter of your Windows installation media? "
cd %Path%
SetupRST.exe -extractdrivers %Windows%\SetupRST_extracted
if errorlevel 1 goto :Done
move SetupRST.exe %Windows%
if errorlevel 1 goto :Done
echo.
echo Your Windows installation media now has the Intel RST driver. You can now load the Intel RST driver (it's in %Windows%\SetupRST_extracted) from within the Windows setup. Once the system boots into the OS, run the SetupRST.exe file from the root directory of your Windows installation media. This will install the Windows driver and give the opportunity to download the Intel Optane Memory and Storage Management application from the Microsoft Store for management of RAID/Intel Optane memory volumes. Press any key to close this batch file.
endlocal
pause
exit