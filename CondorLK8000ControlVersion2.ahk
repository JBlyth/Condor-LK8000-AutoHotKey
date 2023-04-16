#InstallKeybdHook
#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn   ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;CoordMode,Mouse,Screen ****NOT REQUIRED ***

SetTitleMatchMode, 2
SetControlDelay 1  ;If set to -1, nothing works. 1 seems to be a reliable choice!
DetectHiddenWindows, On

;WinActivate LK8000 ;****?? NOT REQUIRED FOR VR USE - I'll see if Condor remains in focus at startup!

#SingleInstance force
WinSet, Style, -0xC00000, LK800

!'::
IfWinExist ahk_exe LK8000-PC.EXE
{
 ;if !FileExist("C:\Users\jblyt\LK8000.txt")
 ;{
 CoordMode,Mouse,Screen
 WinGetPos, X, Y, W, H, LK8000
 Horz:=X+(W*.1)
 Vert:=Y+(H*.9)
 WinActivate, LK8000
 sleep 300 ;2000
 ;DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
 Mouseclick, Left, Horz, Vert
 sleep 2000 ;5000
 Horz:=X+(W*.5)
 Vert:=Y+(H*.5)
 Mouseclick, Left, Horz, Vert
 sleep 500 ;2000
 WinActivate, ahk_exe CONDOR.EXE
 sleep 1000 ;2000
 WinGetPos, X, Y, W, H, ahk_exe CONDOR.EXE
 Horz:=X+(W*.5)
 Vert:=Y+(H*.5)
 Mouseclick, Left, Horz, Vert
 CoordMode,Relative,Window
 ;ComObjCreate("SAPI.SpVoice").Speak("Flight Plan Copied and Utilities Started")
 ;sleep 1000
;FileAppend, LK8000 Started, C:\Users\jblyt\LK8000.txt
;}
}
Return

;Next Waypoint - Menu/Nav/Waypoint Next
!S::
SendToLK("{F1}")
SendMouse("Nav")
SendMouse("Waypoint`nFinish")
SendMouse("Waypoint`nNext")
SendMouse("Cancel")
Return

;Previous Waypoint - Menu/Nav/Waypoint Previous
^S::
SendToLK("{F1}")
SendMouse("Nav")
SendMouse("Waypoint`nPrevious")
SendMouse("Waypoint`nStart")
SendMouse("Cancel")
Return

;Start Free Flight - Menu/Custom Menu/Free Flight/Click Yes
!F::
SendToLK("{F1}") 
SendMouse("Custom`nMenu")
SendMouse("Free`nFlight")
SendMouse("Yes")
;SendToLK("{W}")
;sleep 300
;SendMouse("Yes")
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Free Flight Started")
Return

;ReStart TASK - Menu/Nav/Nav/Task Restart/Click Yes
!E::
SendToLK("{F1}") 
SendMouse("Nav")
SendMouse("Nav`n1/3")
SendMouse("Task`nRestart")
SendMouse("Yes")
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Task Re-Started")
return

;Arm Toggle Advance - Menu/Custom Menu/Arm Toggle
!9::
SendToLK("{F1}") 
SendMouse("Custom`nMenu")
SendMouse("Arm`nToggle")
;SendToLK("{U}") 
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Armed Advance")
Return

;Toggle Auto Zoom - Menu/Custom Menu/Auto Zoom
^9::
SendToLK("{F1}") 
SendMouse("Custom`nMenu")
SendMouse("Auto`nZoom")
;SendToLK("{I}") 
sleep 300
ComObjCreate("SAPI.SpVoice").Speak("Toggle Auto Zoom")
Return

; Increase MacReady by 5 - Menu/Thermal/Increase MacReady/OK
!=::
SendToLK("{F1}") 
SendToLK("{Right 6}") 
SendToLK("{Enter}") 
SendToLK("{Down}") 
SendToLK("{Enter}") 
SendToLK("{Down}") 
SendToLK("{Enter}") 
Return

; Decrease MacReady by 5 - Menu/Thermal/Increase MacReady/OK
!-::
SendToLK("{F1}") 
SendToLK("{Right 6}") 
SendToLK("{Enter}") 
SendToLK("{Up 2}") 
SendToLK("{Enter}") 
SendToLK("{Down 4}") 
SendToLK("{Enter}") 
Return

; Bottom Menu Forward
!N::
Horz:=.75
Vert:=.9
ClickMouse(Horz,Vert)
;SendToLK("{S}")
Return

; Bottom Menu Back
!/::
Horz:=.1
Vert:=.9
ClickMouse(Horz,Vert)
;SendToLK("{A}")
Return

; Zoom In
!X::
Horz:=.5
Vert:=.2
ClickMouse(Horz,Vert)
;SendToLK("{UP}")
Return

; Zoom Out
!Z::
Horz:=.5
Vert:=.6
ClickMouse(Horz,Vert)
;SendToLK("{DOWN}")
Return

;Cycle MultiMaps Left Side Click
!\::
Horz:=.1
Vert:=.5
ClickMouse(Horz,Vert)
;SendToLK("{Right}") 
Return

;Long Press Middle Bottom
!H::
WinGetPos, X, Y, W, H, LK8000
Horz:=.5
Vert:=.9
Horz *= W
Vert *= H
ControlClick, x%Horz% y%Vert%, LK8000,,,,NA D
sleep 1500
ControlClick, x%Horz% y%Vert%, LK8000,,,,NA U
return

;Make CoMoMap.exe ACTIVE
F9::
If WinExist("ahk_exe CoMoMap.exe")
 WinActivate
 CoordMode,Mouse,Screen
 WinGetPos, X, Y, W, H, A
 Horz:=X+(W*.3)
 Vert:=Y+(H*.05)
 ;sleep 300
 DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
 CoordMode,Relative,Window
return

;Make CONDOR ACTIVE
F10::
#IfWinExist ahk_exe CONDOR.EXE
WinActivate, ahk_exe CONDOR.EXE
Return

;Make LK8000 ACTIVE
F11::
#IfWinExist ahk_exe LK8000
WinActivate, LK8000
CoordMode,Mouse,Screen
WinGetPos, X, Y, W, H, LK8000
Horz:=X+(W*.5)
Vert:=Y+(H*.5)
;sleep 300
DllCall("SetCursorPos", "int", Horz, "int", Vert)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).
CoordMode,Relative,Window
Return

ClickMouse(Horz,Vert) ;Clicks Screen where pointed by Horz and Vert
{
  WinGetPos, X, Y, W, H, LK8000
  Horz *= W
  Vert *= H
  ;Msgbox %Horz% %Vert%
  ControlClick, x%Horz% y%Vert%, LK8000,,,,NA
  ;MouseMove, %Horz%, %Vert%
  return
}

SendMouse(ControlName) ;Clicks App Control Button set by ControlName
{
  WinGet, WinID, ID, LK8000 ; probably not necessary, could just use LK8000 instead of %WinID%
  ControlGetPos , X, Y, W, H, %ControlName%, ahk_id %WinID%
  Horz:=(W*.5) ; clicks the middle of the control
  Vert:=(H*.5)
  ControlClick,%ControlName%,ahk_id %WinID%,,,,NA x%Horz% y%Vert%
  sleep 300
  return
}

; Handles piping individual keys to LK8000
SendToLK(k)
{
  ; Yes, this is pretty much belt AND suspenders ... and it's still not
  ; quite enough for all scenarios, due to some quirks in either AHK, XCS, or both
  WinGet, WinID, ID, LK8000
  ControlGetFocus,CursorPosition, LK8000
  if not CursorPosition
  ControlSend, ahk_parent, %k%, ahk_id %WinID%
  else
  {
	ControlSend, %CursorPosition%, %k%, ahk_id %WinID%
  }
  return
}
