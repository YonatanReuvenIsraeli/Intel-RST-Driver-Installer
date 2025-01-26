@echo off
title Intel RST Driver Installer
setlocal
echo Program Name: Intel RST Driver Installer
echo Version: 1.5.1
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
goto "Start"

:"InWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
exit

:"Start"
echo.
echo [1] Download RAID or Intel Optane Memory H Series.
echo [2] Download Intel Optane Memory M Series.
echo [3] Already have downloaded the Intel RST driver ("SetupRST.exe").
echo.
set Driver=
set /p Driver="What do you want to do? (1-3) "
if /i "%Driver%"=="1" goto "Driver1"
if /i "%Driver%"=="2" goto "Driver2"
if /i "%Driver%"=="3" goto "RSTPath"
echo Invalid syntax!
goto "Start"

:"Driver1"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/720755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-11th-up-to-13th-gen-platforms.html
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/720755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-11th-up-to-13th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver ("SetupRST.exe").
pause > nul 2>&1
goto "RSTPath"

:"Driver2"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html?v=t
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html?v=t
echo.
echo Press any key to continue once you have downloaded the Intel RST driver ("SetupRST.exe").
pause > nul 2>&1
goto "RSTPath"

:"RSTPath"
echo.
set RSTPath=
set /p RSTPath="What is the path to the folder your downloaded Intel RST driver ("SetupRST.exe") is in? "
if not exist "%RSTPath%\SetupRST.exe" goto "RSTPathNotExist"
goto "Mount"

:"RSTPathNotExist"
echo "%RSTPath%\SetupRST.exe" does not exist! Please try again.
goto "RSTPath"

:"Mount"
echo.
echo Please mount your Windows Disk Image/Windows installation media then press any key to continue.
pause > nul 2>&1
goto "Windows"

:"Windows"
echo.
set Windows=
set /p Windows="What is the drive letter of your Windows Disk Image/Windows installation media? (A:-Z:) "
if /i "%Windows%"=="A:" goto "SureWindows"
if /i "%Windows%"=="B:" goto "SureWindows"
if /i "%Windows%"=="C:" goto "SureWindows"
if /i "%Windows%"=="D:" goto "SureWindows"
if /i "%Windows%"=="E:" goto "SureWindows"
if /i "%Windows%"=="F:" goto "SureWindows"
if /i "%Windows%"=="G:" goto "SureWindows"
if /i "%Windows%"=="H:" goto "SureWindows"
if /i "%Windows%"=="I:" goto "SureWindows"
if /i "%Windows%"=="J:" goto "SureWindows"
if /i "%Windows%"=="K:" goto "SureWindows"
if /i "%Windows%"=="L:" goto "SureWindows"
if /i "%Windows%"=="M:" goto "SureWindows"
if /i "%Windows%"=="N:" goto "SureWindows"
if /i "%Windows%"=="O:" goto "SureWindows"
if /i "%Windows%"=="P:" goto "SureWindows"
if /i "%Windows%"=="Q:" goto "SureWindows"
if /i "%Windows%"=="R:" goto "SureWindows"
if /i "%Windows%"=="S:" goto "SureWindows"
if /i "%Windows%"=="T:" goto "SureWindows"
if /i "%Windows%"=="U:" goto "SureWindows"
if /i "%Windows%"=="V:" goto "SureWindows"
if /i "%Windows%"=="W:" goto "SureWindows"
if /i "%Windows%"=="X:" goto "SureWindows"
if /i "%Windows%"=="Y:" goto "SureWindows"
if /i "%Windows%"=="Z:" goto "SureWindows"
echo Invalid syntax!
goto "Windows"

:"SureWindows"
echo.
set SureWindows=
set /p SureWindows="Are you sure "%Windows%" is the drive letter of your Windows Disk Image/Windows installation media? (Yes/No) "
if /i "%SureWindows%"=="Yes" goto "CheckExistWindows"
if /i "%SureWindows%"=="No" goto "Windows"
echo Invalid syntax!
goto "SureWindows"

:"CheckExistWindows"
if not exist "%Windows%" goto NotExist
goto "CheckIfWindowsDiskImageWindowsinstallationmedia"

:"NotExist"
echo "%Windows%" does not exist. Please try again.
goto "Windows"

:"CheckIfWindowsDiskImageWindowsinstallationmedia"
if exist "%Windows%\sources" goto "Done"
if exist "%Windows%\x86\sources" goto "Done"
if exist "%Windows%\x64\sources" goto "Done"
echo "%Windows%" is not a Windows Disk Image/Windows installation media. Please try again.
goto "Windows"

:"Done"
echo.
if exist "%Windows%\SetupRST_extracted" goto "ExtractedExist"
if exist "%Windows%\SetupRST.exe" goto "SetupRSTExist"
echo Installing Intel RST driver.
"%RSTPath%\SetupRST.exe" -extractdrivers "%Windows%\SetupRST_extracted"
if not errorlevel 0 goto "Error"
move "%RSTPath%\SetupRST.exe" "%Windows%" > nul 2>&1
if not errorlevel 0 goto "Error"
echo.
echo Your Windows Disk Image/Windows installation media now has the Intel RST driver. You can load the Intel RST driver (its location is "%Windows%\SetupRST_extracted") from Windows Setup. After the system boots into Windows, run "SetupRST.exe" (it's location is "%Windows%\SetupRST.exe"). This will install the required Windows driver and provide the option to download the Intel Optane Memory and Storage Management app from the Microsoft Store. This app allows you to manage RAID and Intel Optane memory volumes. Press any key to close this batch file.
endlocal
pause > nul 2>&1
exit

:"ExtractedExist"
echo.
echo Please rename to something else or move to another location "%Windows%\SetupRST_extracted" in order for this batch file to proceed. "%Windows%\SetupRST_extracted" is not a system file. Press any key to continue when "%Windows%\SetupRST_extracted" is renamed to something else or moved to another location.
pause > nul 2>&1
goto "Done"

:"SetupRSTExist"
echo.
echo Please rename to something else or move to another location "%Windows%\SetupRST.exe" in order for this batch file to proceed. "%Windows%\SetupRST.exe" is not a system file. Press any key to continue when "%Windows%\SetupRST.exe" is renamed to something else or moved to another location.
pause > nul 2>&1
goto "Done"

:"Error"
rd "%Windows%\SetupRST_extracted" /s /q > nul 2>&1
del "%Windows%\SetupRST.exe" /f /q > nul 2>&1
echo There has been an error! You can try again.
goto "RSTPath"
