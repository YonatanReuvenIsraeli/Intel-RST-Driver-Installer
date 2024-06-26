@echo off
title Intel RST Driver Installer
setlocal
echo Program Name: Intel RST Driver Installer
echo Version: 1.3.5
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
goto Start

:Start
echo.
echo [1] Download RAID or Intel Optane Memory H Series.
echo [2] Download Intel Optane Memory M Series.
echo [3] Already have downloaded the Intel RST driver.
set Driver=
set /p Driver="What do you want to do? (1-3) "
if /i "%Driver%"=="1" goto Driver1
if /i "%Driver%"=="2" goto Driver2
if /i "%Driver%"=="3" goto FullPath
echo Invalid syntax!
goto Start

:Driver1
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/720755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-11th-up-to-13th-gen-platforms.html
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/720755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-11th-up-to-13th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto FullPath

:Driver2
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html?v=t
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html?v=t
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto FullPath

:FullPath
echo.
set FullPath=
set /p FullPath="What is the full path to your downloaded Intel RST driver? "
if not exist "%FullPath%" goto FullPathNotExist
goto Windows

:FullPathNotExist
echo "%FullPath%" does not exist!
goto FullPath

:Windows
echo.
set Windows=
set /p Windows="What is the drive letter of your Windows installation media? (A:-Z:) "
if /i "%Windows%"=="A:" goto Done
if /i "%Windows%"=="B:" goto Done
if /i "%Windows%"=="C:" goto Done
if /i "%Windows%"=="D:" goto Done
if /i "%Windows%"=="E:" goto Done
if /i "%Windows%"=="F:" goto Done
if /i "%Windows%"=="G:" goto Done
if /i "%Windows%"=="H:" goto Done
if /i "%Windows%"=="I:" goto Done
if /i "%Windows%"=="J:" goto Done
if /i "%Windows%"=="K:" goto Done
if /i "%Windows%"=="L:" goto Done
if /i "%Windows%"=="M:" goto Done
if /i "%Windows%"=="N:" goto Done
if /i "%Windows%"=="O:" goto Done
if /i "%Windows%"=="P:" goto Done
if /i "%Windows%"=="Q:" goto Done
if /i "%Windows%"=="R:" goto Done
if /i "%Windows%"=="S:" goto Done
if /i "%Windows%"=="T:" goto Done
if /i "%Windows%"=="U:" goto Done
if /i "%Windows%"=="V:" goto Done
if /i "%Windows%"=="W:" goto Done
if /i "%Windows%"=="X:" goto Done
if /i "%Windows%"=="Y:" goto Done
if /i "%Windows%"=="Z:" goto Done
echo Invalid syntax!
goto Windows

:Done
"%FullPath%" -extractdrivers "%Windows%\SetupRST_extracted"
if not errorlevel 0 goto Error
move "%FullPath%" "%Windows%" > nul 2>&1
if not errorlevel 0 goto Error
echo.
echo Your Windows installation media now has the Intel RST driver. You can now load the Intel RST driver (it's in "%Windows%\SetupRST_extracted") from within the Windows setup. Once the system boots into the OS, run the SetupRST.exe file (it's in %Windows%\SetupRST.exe). This will install the Windows driver and give the opportunity to download the Intel Optane Memory and Storage Management application from the Microsoft Store for management of RAID/Intel Optane memory volumes. Press any key to close this batch file.
endlocal
pause > nul 2>&1
exit

:Error
echo.
echo There has been an error! You can try again.
goto FullPath
