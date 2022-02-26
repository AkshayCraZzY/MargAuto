#NoEnv
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
;file1 := FileOpen("docattached", "w")
;file1.close()
file := FileOpen("path.txt", "r")
path:= file.ReadLine()
StringTrimLeft, filename, path, 17
;msgbox, % filename

folder:=SubStr(path,1, 17)
;MsgBox % folder
log("Folder : " folder . "`nFilename : "filename . "`n\\\\\\\\\\\\")

if not WinExist("ahk_exe chrome.exe")
{
	;RETURN
}
Else
{
	WinActivate
	;RETURN
}
WinWait, ahk_class #32770,, 1
if ErrorLevel
{
    msgbox no
}
Else
{  
    WinActivate
    sleep 700
    send !d
    sleep 600
    SendInput, % folder
    sleep 600
    ;send {Enter}
    sleep 600
    send !n
    sleep 600
    SendInput, % filename
    sleep 600
    send {Enter}
    FileAppend,, docattached
    ;msgbox, Send?
    ;WinActivate
    ;sleep 900
    ;send {Enter}
    ;msgbox, Sent!
    ;run, whatsapp.py
    log("sendDoc Done`n\\\\\\\\\\\\")
    ExitApp
}

log(msg)
{
	FileAppend, 
	(
		%msg%`n
	), debug.log
	return
}
   
