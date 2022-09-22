'Script to copy flight plan on start of flight, change the Waypoint advance for AAT tasks to "ArmTPs", and start LK8000 once everything else has been completed
' - John Blyth - jblyth@cheerful.com
'YOU MUST Modify Lines 7 and 8 to suit your Condor Folders
dim fso,Data(1000), MapName, StartPoint, CondorFlightPlanCondorFlightPlanSourceFile, FirstWP,DestinationFile,CondorFlightPlanFolder
Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
CondorFlightPlanCondorFlightPlanSourceFile = "Path to your Flight PLan file. Default name is Flightplan.fpl"
CondorFlightPlanFolder="PAth to your FlightPlans FOLDER" 'DO NOT a trailing \ at the end of the folder name!
if instr(1,CondorFlightPlanCondorFlightPlanSourceFile,"\")=0 or instr(1,CondorFlightPlanFolder,"\")=0 then
 msgbox "You MUST setup you the variables on lines 7 and 8 of this script to suit your Condor installation first!" &VbCrLf &VbCrLf &"QUITTING NOW!"
 Wscript.quit
end if
WorkATT
WScript.Sleep 1000
AutoStartFromCondor
WScript.Sleep 1000
t=WshShell.Run(chr(34) &"C:\Users\jblyt\OneDrive\Desktop\Condor\CondorStartLK8000.bat" &chr(34),7,false) 'NOTE:- running the startup of LK8000 shortcut seems to work much better from a batch file
WScript.Sleep 3000
WshShell.sendkeys ("%'") 'Using AutoHotKey to bring Condor to the fore works better than the WshShell.AppActivate command
WScript.Sleep 300
wscript.quit

sub AutoStartFromCondor()
 DestinationFile=CondorFlightPlanFolder &"\LK-" &MapName &"_" &FirstWP &"_" &right("0" &day(date),2) &right("0" &month(date),2) &year(date) &".fpl"
 'MSGBOX CondorFlightPlanCondorFlightPlanSourceFile &"  " &DestinationFile
 fso.CopyFile CondorFlightPlanCondorFlightPlanSourceFile, DestinationFile
end sub

sub WorkATT()
set Myfile1=fso.OpenTextFile(CondorFlightPlanCondorFlightPlanSourceFile,1)
a=MyFile1.readline
a=MyFile1.readline
a=MyFile1.readline
a=MyFile1.readline
MapName=MyFile1.readline
MapName = mid(MapName,instr(1,MapName,"=")+1, 200)
'msgbox MapName
MyFile1.close
SourceDir2 = "C:\Users\jblyt\Onedrive\LK8000\_Tasks\Default.lkt"
set Myfile2=fso.OpenTextFile(SourceDir2,1)
n=1
x=0
zz=0
do while not MyFile2.AtEndOfStream
 Data(n)=MyFile2.readline
 z=instr(1,Data(n),"name=")
 if instr(1,Data(n),"TPName0=") > 0 then FirstWP=instr(1,Data(n),"TPName0=")
 if z>0 and zz=0 then
  zz=1
  m=instr(z+2,Data(n),chr(34))
  StartPoint=mid(Data(n),z+6,m-z+5)
 end if
 if n=2 then
  if instr(1,Data(n),"AAT")>0 then
   a=MyFile2.readline
   b=instr(3,a,"Manual")
   if b>0 then
    x=1
    Data(n+1) = left(a,b-1) &"ArmTPs" &mid(a,b+6,100)
    n=n+1
   end if
  end if 
 end if  
 n=n+1
loop
if x=1 then
 set Myfile3=fso.CreateTextFile(SourceDir2,1)
 do while x<n
  MyFile3.Writeline Data(x)
  x=x+1
 loop
 MyFile3.close
end if 
MyFile2.close
end sub

