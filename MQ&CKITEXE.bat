@echo off

rem Step 1: Get the path to the main .exe from user input
echo "********************************************************************"
echo     USER NEED TO ENTER THE PATH OF SOFTWARE /DRAG AND DROP IN CMD   
echo "********************************************************************"
set /p main_exe_path="Enter the path of software "

rem Extract the file name from the full path and Display the extracted file name
echo "************************SOFTWARE TO INSTALL*************************"
for %%F in ("%main_exe_path%") do set "executable_filename=%%~nxF"
echo                                                                     
echo "********************************************************************"
echo Software Name To Install: %executable_filename%                     
echo "********************************************************************"

rem Extract "version_number" from the filename
set "version="
for /f "tokens=2 delims=_-" %%a in ("%executable_filename%") do set "version=%%a"
echo "********************************************************************"
echo                   SOFTWARE VERSION NAME                             
echo "********************************************************************"
echo                                                                     
echo "********************************************************************"
echo                Extracted version: %version%                         
echo "********************************************************************"
echo "                                                                    "
echo "                                                                    "
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "********************************************************************"
echo "                SOFTWARE EXECUTION STARTED                          "
echo "                WAIT UNTILL IT EXECUTED.                            "
echo "********************************************************************"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "INSTALLING.........................................................."
rem Step 2: Execute the main .exe given by the user
start "" /wait "%main_exe_path%"
echo "********************************************************************"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "********************************************************************"
echo "                INSTALLED THE SOFTWARE                              "
echo "********************************************************************"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
rem Step 4-7: Check and perform operations in the "v5.12.0" folder
set "folder_prefix=%version%"
set "main_folder_path=%main_exe_path%\..\"
for %%F in ("%main_folder_path%") do set "main_folder_path=%%~dpnF"
echo "********************************************************************"
echo "PATH OF SOFTWARE : %main_folder_path%                               "
echo "********************************************************************"
set "found_folder="
for /d %%i in ("%main_folder_path%%folder_prefix%*") do (
    set "found_folder=%%~nxi"
    set "found_folder_path=%%i"
)
if not defined found_folder (
    echo No folder found starting with %folder_prefix%
    exit /b 1
)
echo "********************************************************************"
echo "EXTRACTED SOFTWARE NAME: %found_folder%                             "
echo "FULL PATH OF THE SOFTWARE : %found_folder_path%                     "
echo "********************************************************************"
echo "                                                                    "
echo "              Navigate to the target folder                         " 
pushd "%found_folder_path%" || exit /b 1
echo "-------------------------------------------------------------------"
echo Print files inside the folder "%found_folder%":                  
echo "-------------------------------------------------------------------"
dir /b 
rem Step 7: Execute all .exe files inside the folder
echo "-------------------------------------------------------------------"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "********************************************************************"
echo "            EXECUTING ALL SOFTWARE LISTED ABOVE AS PER USER NEED    "
echo "********************************************************************"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "____________________________________________________________________"
echo "                                                                    "
echo "********************************************************************"
echo INSTALLING : "DeploymentTool*.exe"
echo "********************************************************************"
echo "STARTED INSTALLING.................................................."
rem Step 2: Execute the main .exe given by the user
for %%f in ("DeploymentTool*.exe") do start "" /wait "%%f"
echo "                                                                    "
echo "********************************************************************"
echo INSTALLING: "GraphVisualiser*.exe"
echo "********************************************************************"
echo "STARTED INSTALLING.................................................."
for %%f in ("GraphVisualiser*.exe") do start "" /wait "%%f"
echo "                                                                    "
echo "********************************************************************"
echo INSTALLING : "LogScanner*.exe"
echo "********************************************************************"
echo "STARTED INSTALLING.................................................."
for %%f in ("LogScanner*.exe") do start "" /wait "%%f"
echo "                                                                    "
echo "********************************************************************"
echo INSTALLING : "ParkSimulator*.exe"
echo "********************************************************************"
echo "STARTED INSTALLING.................................................."
for %%f in ("ParkSimulator*.exe") do start "" /wait "%%f"
echo "                                                                    "
echo "********************************************************************"
echo INSTALLING :  "PowerMeter*.exe"
echo "********************************************************************"
echo "STARTED INSTALLING.................................................."
for %%f in ("PowerMeter*.exe") do start "" /wait "%%f"
echo "                                                                    "
REM echo "********************************************************************"
REM echo INSTALLING : "TFROpener*.exe"
REM echo "********************************************************************"
REM echo "STARTED INSTALLING.................................................."
REM for %%f in ("TFROpener*.exe") do start "" /wait "%%f"

echo "********************************************************************"
echo Opening DeploymentTool
echo "********************************************************************"
set "DeploymentTool=C:\Program Files (x86)\Vestas\Deployment Tool"
set "DeploymentToolName=DeploymentTool.exe"
cd /d "%DeploymentTool%" && start /wait "" "%DeploymentToolName%"
echo "********************************************************************"
echo Opening ParkSimulator
echo "********************************************************************"
set "ParkSmulator=C:\Program Files (x86)\Vestas\ParkSimulator2\Shortcuts"
set "ParkSmulatorName=PPC_Default.lnk"
cd /d "%ParkSmulator%" && start /wait "" "%ParkSmulatorName%"
echo "********************************************************************"
echo Opening PowerMeter
echo "********************************************************************"
set "PowerMeter=C:\Program Files (x86)\Vestas\PowerMeterSimulator\Shortcuts"
set "PowerMeterNmae=PowerMeterSimulator  (Mk5).lnk"
cd /d "%PowerMeter%" && start /wait "" "%PowerMeterNmae%"
pause
exit /b 0
rem PPCSoftwareInstall_v5.11.0-rc-43-gbf23141-bugfix_MSUDemand&MSUSwitchkvr-GV-Tool_tkedition
REM "C:\Program Files (x86)\Vestas\Deployment Tool\DeploymentTool.exe"
REM "C:\Program Files (x86)\Vestas\ParkSimulator2\Shortcuts\PPC_Default.lnk"
REM "C:\Program Files (x86)\Vestas\PowerMeterSimulator\Shortcuts\PowerMeterSimulator  (Mk5).lnk" 