echo off
cd C:\Program Files\Oracle\VirtualBox
cls
:MENU
echo Fetz_tool_VMLAB
echo.
echo ...............................................
echo PRESS 1, 2, 3 to select your task, or 4 to quit.
echo ...............................................
echo.
echo 1 - Start existing VM
echo 2 - Create and start a new VM
echo 3 - Delete a VM
echo 4 - Close this window
echo.
set /P M=Type 1, 2, 3 or 4 then press ENTER: 
if %M%==1 goto START
if %M%==2 goto CREATE
if %M%==3 goto DELETE
if %M%==4 goto EOF

:START
VBoxManage list vms
set /P vm_name=Which VM do you want to start: 
VBoxManage startvm %vm_name%
VBoxManage controlvm "%vm_name%" setvideomodehint 3440 1400 32
EXIT /B 0
:CREATE
set /p vm_name=" New VM's name ?"
VBoxManage clonevm <TEMPLATE_NAME> --name %vm_name% --register
VBoxManage startvm %vm_name%
VBoxManage setextradata global GUI/MaxGuestResolution any
VBoxManage setextradata "%vm_name%" "WideScreen" "3440x1440x32"
VBoxManage controlvm "%vm_name%" setvideomodehint 3440 1400 32
EXIT /B 0
:DELETE
VBoxManage list vms
set /P vm_name=Which VM do you want to delete: 
VBoxManage unregistervm --delete %vm_name%
GOTO MENU
