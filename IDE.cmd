::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyGE4KQ5wSRK+DHm1DLAf/NTYws64hkgLaOMtbMHPwqDu
::fBE1pAF6MU+EWH3eyGE4KQ5wSRK+DHm1DLAf/NTYws64hkgLaOY6eprc26aabvQL/iU=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHqM9VcULQ1oaAuVMme1B7EP1O76+eOErUNdHLZ2NobY1dQ=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQITIBpBZSCnfEm7ErYUqP7+/fmOrUN9
::eg0/rx1wNQPfEVWB+kM9LVsJDA2GOSW/HrB8
::fBEirQZwNQPfEVWB+kM9LVsJDCeKPX6TIpBcyunv7OLHtEgPR+swdu8=
::cRolqwZ3JBvQF1fEqQIRJlt9aCHCOG6pD7ISqO70/aqFo1keXII=
::dhA7uBVwLU+EWHqM9VcULQ0UfwuEKHy7FLB8
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmG9VYzIFtBXwGQcm6iA9U=
::Zh4grVQjdCuDJHqM9VcULQ1ofBaNNm65Eok/xczEy++Rnm4VVfcWXKr526CNKNYW+AvhbZNN
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
set maincmd="main.cmd"
set mainbat="main.bat"
type art.txt
echo.
echo.
echo Welcome to IDE ! [N: New Project] [E: Exit] [C: Check for Update] 
choice /c NCES /m "Select an option: "
if %errorlevel%==1 goto new_pro
if %errorlevel%==2 goto check_for_new
if %errorlevel%==3 goto exit
if %errorlevel%==4 goto config

cls
:new_pro
echo [========== New Project ========]
set /p name=Type the name: 
REM set /p location= Type the location (Not Include C: or any drive type):
REM cd %name%
mkdir %name%
cd %name%
echo Choose Type: B: bat C: cmd
choice /c BC /m "Select file type: "
if %errorlevel%==1 goto batch
if %errorlevel%==2 goto cmd

:batch
type nul > main.bat
cls
echo Welcome to the Editor! Type Everything.
echo Ctrl-Z To Stop
echo.

copy con %mainbat%
if exist main.bat (
    echo File saved successfully!
) else (
    echo Failed to save the file.
)
cd..
cls
type debugart.txt
cd %name%
echo ============================
echo You are entering debug mode.
echo Errors will be recorded here.
echo Log: On
echo ============================
echo To stop, press Ctrl+C.
echo.

set mainide=ide.cmd
set debug_target=main.bat
set log_file=debug.txt

echo Starting debug mode for %debug_target%
echo.
del debug.txt
call %debug_target% > %log_file% 2>&1

echo.
echo Debugging completed. Check %log_file% for details.
echo %TIME% 
echo.
pause
goto main
pause
goto exit

:cmd
type nul > main.cmd
cls
echo Welcome to the Editor! Type Everything.
echo Ctrl-Z To Stop
echo.


copy con %maincmd%
if exist main.cmd (
    echo File saved successfully!
) else (
    echo Failed to save the file.
)
pause
cd..
cls
type debugart.txt
cd %name%
echo ============================
echo You are entering debug mode.
echo Errors will be recorded here.
echo Log: On
echo ============================
echo To stop, press Ctrl+C.
echo.

set mainide=ide.cmd
set debug_target=main.cmd
set log_file=debug.txt

echo Starting debug mode for %debug_target%
echo.
del debug.txt
call %debug_target% > %log_file% 2>&1

echo.
echo Debugging completed. Check %log_file% for details.
echo %TIME% 
echo.
pause
goto main
:check_for_new
echo Checking... *do not close*
wget https://chaudevsoftware.github.io/software_list/chauide_batchver/update.cmd | start update.cmd
echo No Update! You are using lastest ver! 
:exit
exit

