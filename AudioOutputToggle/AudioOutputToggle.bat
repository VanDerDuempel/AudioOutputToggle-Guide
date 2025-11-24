@echo off
setlocal

:: Pfad zum SoundVolumeView
set SVV="C:\vs-code-projects\AudioOutputToggle\soundvolumeview-x64\SoundVolumeView.exe"

:: Namen der beiden Ausgabegeräte (genau aus /scomma entnommen!)
set NAME1=Headset Earphone
set NAME2=S2418H/HX

:: Temp-Datei als Toggle-Zustand
set STATEFILE=%temp%\audio_toggle_state.txt

if exist "%STATEFILE%" (
    %SVV% /SetDefault "%NAME1%" 0
    del "%STATEFILE%"
) else (
    %SVV% /SetDefault "%NAME2%" 0
    echo toggled > "%STATEFILE%"
)

endlocal
