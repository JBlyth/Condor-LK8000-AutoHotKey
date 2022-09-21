#SingleInstance force ; Control LK8000 from Condor 2 Joystick in VR or in Multi-Monitor Setup by John Blyth
;#WinActivateForce
CoordMode,Mouse,Screen

;Run after batch fuile called from CoTaCo starts LK8000 and CoTASA
!'::
IfWinExist ahk_exe LK8000-PC.EXE
{
 WinGetPos, X, Y, W, H, LK8000
 Horz:=X+(W*.1)
 Vert:=Y+(H*.9)
 WinActivate, LK8000
 sleep 2000
 ;DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
 Mouseclick, Left, Horz, Vert
 sleep 5000
 ;MsgBox, LK8000 is at %X%`,%Y% and its size is %W%x%H%
 ;WinGetPos, X, Y, W, H, LK8000
 Horz:=X+(W*.5)
 Vert:=Y+(H*.5)
 Mouseclick, Left, Horz, Vert
 sleep 2000
 WinActivate, ahk_exe CONDOR.EXE
 sleep 2000
 WinGetPos, X, Y, W, H, ahk_exe CONDOR.EXE
 Horz:=X+(W*.5)
 Vert:=Y+(H*.5)
 Mouseclick, Left, Horz, Vert
 ;Mouseclick, Right, 100, 100
 ComObjCreate("SAPI.SpVoice").Speak("Flight Plan Copied and Utilities Started")
 sleep 1000
}
Return

;RESTART TARGET SOFTWARE
!Y::
IfWinExist ahk_exe TARGETGUI.EXE
WinClose
ComObjCreate("SAPI.SpVoice").Speak("Closing TARGET Software")
Sleep 6000
Run "C:\Program Files (x86)\Thrustmaster\TARGET\x64\TARGETGUI.EXE" -r "C:\Users\jblyt\OneDrive\Documents\Thrustmaster\Condor JB FULL RUDDER3 - VR.tmc"
sleep 3000
ComObjCreate("SAPI.SpVoice").Speak("TARGET Software Re-started")
sleep 1500
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
Return

;Next Waypoint - Menu/Nav/NextWaypoint
!S::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {F1}
Send {Enter}
Send {Right 4}
Send {Enter}
Send {F1}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Previous Waypoint - Menu/Nav/NextWaypoint
^S::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {F1}
Send {Enter}
Send {Left 2}
Send {Enter}
Send {F1}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Start Free Flight - Menu/Custom Menu/Free Flight/Click Yes
!F::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.26)
Vert:=Y+(H*.5)
WinActivate, LK8000
sleep 300
Send {W}
sleep 300
Mouseclick, Left, Horz, Vert
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Free Flight Started")
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;ReStart TASK - Menu/Nav/Nav/Task Restart/Click Yes
!E::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.26)
Vert:=Y+(H*.55)
WinActivate, LK8000
sleep 300
Send {F1}
Send {Enter 2}
Send {Right 5}
Send {Enter}
sleep 300
Send {Enter}
sleep 300
Mouseclick, Left, Horz, Vert
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Task Re-Started")
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Arm Toggle Advance - Menu/Custom Menu/Arm
!9::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.26)
Vert:=Y+(H*.5)
WinActivate, LK8000
sleep 300
Send {U}
sleep 300
Mouseclick, Left, Horz, Vert
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Armed Advance")
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Toggle Auto Zoom - Menu/Custom Menu/Auto Zoom
^9::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.26)
Vert:=Y+(H*.5)
WinActivate, LK8000
sleep 300
Send {I}
sleep 300
Mouseclick, Left, Horz, Vert
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Toggle Auto Zoom")
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Increase MacReady - Menu/Thermal/Increase MacReady/OK
!=::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {F1}
Send {Right 6}
Send {Enter}
Send {Down}
Send {Enter}
Send {Down}
Send {Enter}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Decrease MacReady - Menu/Thermal/Decrease MacReady/OK
!-::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {F1}
Send {Right 6}
Send {Enter}
Send {Up 2}
Send {Enter}
Send {Down 4}
Send {Enter}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Menu Forward
!N::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {S}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
return

;Menu Back
!/::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {A}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
return

;Zoom In
!X::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {UP}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Zoom Out
!Z::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {DOWN}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;MultiMaps Back AND FORWARD
!\::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
sleep 300
Send {RIGHT}
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
#IfWinExist
Return

;Long Press Middle Bottom
!H::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.5)
Vert:=Y+(H*.9)
WinActivate, LK8000
sleep 300
DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
;MouseMove, Horz, Vert
Click Down
Sleep 2000
Click Up
sleep 300
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
Return

;Make CONDOR ACTIVE
F10::
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
Return

;Make LK8000 ACTIVE
F11::
#IfWinExist ahk_exe LK8000
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.5)
Vert:=Y+(H*.5)
WinActivate, LK8000
sleep 300
DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
;Mouseclick, Right, Horz, Vert ;Centre Screen
sleep 300
Return
