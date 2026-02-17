@echo off
title Intel RST Driver Installer
setlocal
echo Program Name: Intel RST Driver Installer
echo Version: 2.0.4
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
"%windir%\System32\net.exe" user > nul 2>&1
if not "%errorlevel%"=="0" goto "InPERE"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"InPERE"
echo.
echo You are in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Start"
echo.
echo [1] Download Intel RST driver for 8th-9th Gen platforms.
echo [2] Download Intel RST driver for 10th-11th Gen platforms.
echo [3] Download Intel RST driver for 12th-13th Gen platforms.
echo [4] Download Intel RST driver for 12th-15th Gen platforms.
echo [5] Already have downloaded the Intel RST driver.
echo.
set Driver=
set /p Driver="What do you want to do? (1-5) "
if /i "%Driver%"=="1" goto "SureDriver"
if /i "%Driver%"=="2" goto "SureDriver"
if /i "%Driver%"=="3" goto "SureDriver"
if /i "%Driver%"=="4" goto "SureDriver"
if /i "%Driver%"=="5" goto "SureDriver"
echo Invalid syntax!
goto "Start"

:"SureDriver"
echo.
set SureDriver=
if /i "%Driver%"=="1" set /p SureDriver="Are you sure you want to download Intel RST driver for 8th-9th Gen platforms? (Yes/No) "
if /i "%Driver%"=="2" set /p SureDriver="Are you sure you want to download Intel RST driver for 10th-11th Gen platforms? (Yes/No) "
if /i "%Driver%"=="3" set /p SureDriver="Are you sure you want to download Intel RST driver for 12th-13th Gen platforms? (Yes/No) "
if /i "%Driver%"=="4" set /p SureDriver="Are you sure you want to download Intel RST driver for 12th-15th Gen platforms? (Yes/No) "
if /i "%Driver%"=="5" set /p SureDriver="Are you sure you have already have downloaded the Intel RST driver? (Yes/No) "
if /i "%SureDriver%"=="Yes" if /i "%Driver%"=="1" goto "Driver1"
if /i "%SureDriver%"=="Yes" if /i "%Driver%"=="2" goto "Driver2"
if /i "%SureDriver%"=="Yes" if /i "%Driver%"=="3" goto "Driver3"
if /i "%SureDriver%"=="Yes" if /i "%Driver%"=="4" goto "Driver4"
if /i "%SureDriver%"=="Yes" if /i "%Driver%"=="5" goto "RSTPath"
if /i "%SureDriver%"=="No" goto "Start"
echo Invalid syntax!
goto "SureDriver"

:"Driver1"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/19755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-8th-and-9th-gen-platforms.html
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/19755/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-8th-and-9th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto "RSTPath"

:"Driver2"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/19512/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-10th-and-11th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto "RSTPath"

:"Driver3"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/849933/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-12th-to-13th-gen-platforms.html
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/849933/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-12th-to-13th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto "RSTPath"

:"Driver4"
echo.
echo Download Intel RST driver from here. ^-^-^> https://www.intel.com/content/www/us/en/download/849936/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-12th-to-15th-gen-platforms.html
echo.
echo Press any key to open the website.
pause > nul 2>&1
start https://www.intel.com/content/www/us/en/download/849936/intel-rapid-storage-technology-driver-installation-software-with-intel-optane-memory-12th-to-15th-gen-platforms.html
echo.
echo Press any key to continue once you have downloaded the Intel RST driver.
pause > nul 2>&1
goto "RSTPath"

:"RSTPath"
echo.
set RSTPath=
set /p RSTPath="What is the full path of your downloaded Intel RST driver? "
goto "SureRSTPath"

:"SureRSTPath"
echo.
set SureRSTPath=
set /p SureRSTPath="Are you "%RSTPath%" is the full path of your downloaded Intel RST driver? (Yes/No) "
if /i "%SureRSTPath%"=="Yes" goto "RSTPathCheckExist"
if /i "%SureRSTPath%"=="No" goto "RSTPath"
echo Invalid syntax!
goto "SureRSTPath"

:"RSTPathCheckExist"
if not exist "%RSTPath%" goto "RSTPathNotExist"
goto "Mount"

:"RSTPathNotExist"
echo "%RSTPath%" does not exist! Please try again.
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
if exist "%Windows%\sources" goto "CheckExist"
if exist "%Windows%\x86\sources" goto "CheckExist"
if exist "%Windows%\x64\sources" goto "CheckExist"
echo "%Windows%" is not a Windows Disk Image/Windows installation media. Please try again.
goto "Windows"

:"CheckExist"
set SetupRST=
if not exist "%Windows%\SetupRST.exe" if exist "%Windows%\SetupRST_extracted" set SetupRST=SetupRST_extracted
if /i "%RSTPath%"=="%Windows%\SetupRST.exe" if exist "%Windows%\SetupRST_extracted" set SetupRST=SetupRST_extracted
if /i not "%RSTPath%"=="%Windows%\SetupRST.exe" if exist "%Windows%\SetupRST.exe" if not exist "%Windows%\SetupRST_extracted" set SetupRST=SetupRST.exe
if /i not "%RSTPath%"=="%Windows%\SetupRST.exe" if exist "%Windows%\SetupRST.exe" if exist "%Windows%\SetupRST_extracted" set SetupRST=Both
if /i not "%SetupRST%"=="" goto "SetupRSTExist"
goto "SetupRST"

:"SetupRSTExist"
echo.
set SureDelete=
if /i "%SetupRST%"=="SetupRST_extracted" set /p SureDelete="Warning! This will delete your existing Intel RST driver ("%Windows%\SetupRST_extracted"). Are you sure you want to continue? (Yes/No) "
if /i "%SetupRST%"=="SetupRST.exe" set /p SureDelete="Warning! This will overwrite ("%Windows%\SetupRST.exe"). Are you sure you want to continue? (Yes/No) "
if /i "%SetupRST%"=="Both" set /p SureDelete="Warning! This will delete your existing Intel RST driver ("%Windows%\SetupRST_extracted") and overwrite ("%Windows%\SetupRST.exe"). Are you sure you want to continue? (Yes/No) "
if /i "%SureDelete%"=="Yes" if /i "%SetupRST%"=="SetupRST_extracted" goto "SetupRSTDelete"
if /i "%SureDelete%"=="Yes" if /i "%SetupRST%"=="Both" goto "SetupRSTDelete"
if /i "%SureDelete%"=="No" goto "Close"
echo Invalid syntax!
goto "SetupRSTExist"

:"SetupRSTDelete"
echo.
echo Deleting your existing Intel RST driver ("%Windows%\SetupRST_extracted").
rd "%Windows%\SetupRST_extracted" /s /q > nul 2>&1
echo Existing Intel RST driver ("%Windows%\SetupRST_extracted") deleted.
goto "SetupRST"

:"SetupRST"
echo.
echo Installing Intel RST driver.
"%RSTPath%" -extractdrivers "%Windows%\SetupRST_extracted" > nul 2>&1
if not "%errorlevel%"=="0" goto "SetupRSTError"
move "%RSTPath%" "%Windows%\SetupRST.exe" > nul 2>&1
if not "%errorlevel%"=="0" goto "SetupRSTError"
echo Intel RST driver installed.
goto "Done"

:"SetupRSTError"
rd "%Windows%\SetupRST_extracted" /s /q > nul 2>&1
if /i not "%DriveLetter%"=="%Windows%" del "%Windows%\SetupRST.exe" /f /q > nul 2>&1
echo There has been an error! You can try again.
goto "RSTPath"

:"Close"
endlocal
exit

:"Done"
echo.
echo Your Windows Disk Image/Windows installation media now has the Intel RST driver. You can load the Intel RST driver (its location is "%Windows%\SetupRST_extracted") from Windows Setup. After the system boots into Windows, run "SetupRST.exe" (it's location is "%Windows%\SetupRST.exe"). This will install the required Windows driver and provide the option to download the Intel Optane Memory and Storage Management app from the Microsoft Store. This app allows you to manage RAID and Intel Optane memory volumes. Press any key to close this batch file.
endlocal
pause > nul 2>&1
exit
