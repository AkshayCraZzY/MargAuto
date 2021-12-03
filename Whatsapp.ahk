;;;;; todo snum proper


#NoEnv
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
#include <Vis2>
#include <Gdip_All>
log("`n\\\\\\\\\\\\NEW SESSION\\\\\\\\\\\\")
ver=1.2
legloc=D:\Akshay\Ledger\
sName=%A_WorkingDir%\sName.jpg
sNum=%A_WorkingDir%\sNum.jpg
if not WinExist("ahk_exe margwin.exe")
{
	;RETURN
}
Else
{
	WinActivate
	;RETURN
}
sleep 3000
pToken:=Gdip_Startup()
pBitmap:=Gdip_BitmapFromScreen()
pName:=Gdip_CloneBitmapArea(pBitmap,139,77,152,29) 
pNum:=Gdip_CloneBitmapArea(pBitmap,1615,121,97,16)
pNum1 := ResizeBitmap(pNum, 600)	
Gdip_SaveBitmapToFile(pName,sName)
Gdip_SaveBitmapToFile(pNum1,sNum)
tosend:=OCR(sNum)
tosave:=OCR(sName)
MsgBox, 70,, Number is %tosend%`nName is %tosave%,6
IfMsgBox Cancel
{
	ExitApp
}
else IfMsgBox TryAgain
{
	reload
}
else IfMsgBox Continue
{

}
;msgbox,% tosave:=OCR(sName)
log("Identified--`nName:"tosave . "`nNumber:"tosend . "`n\\\\\\\\\\\\")
MouseClick,left,1190,866
sleep 500
send {Shift Down}
sleep 100
;send {End Down}
send {End Down}
sleep 1000
send {Backspace}}
sleep 100
send {End Up}
send {Shift Up}

sleep 200
SendInput,%legloc%%tosave%
SLEEP 300
SEND, !e
lognum(tosend)
sleep 400
dialog:
{
	WinWait, ahk_class #32770,, 1
	if ErrorLevel
	{
		tooltip, WinWait timed out.
		WinWait, ahk_exe Excel.exe,, 1
		if ErrorLevel
		{
			goto, dialog
			;RETURN
		}
		Else
		{
			/*
			oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
			NAme := "Excel.exe"
			for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
				proc.terminate()
				
			FullFilePath := legloc . tosave . ".XLS"
			if !FileExist(FullFilePath)
   				MsgBox, The excel file does not exist.
			Else	
			{
				Run, %FullFilePath%
				WinWait, ahk_exe Excel.exe,, 3
				if ErrorLevel
				{
					;RETURN
				}
				Else
				{
					WinActivate
				}
				;WinActivate
				sleep 400
				send {Del}
				sleep 200
				send ^y
				sleep 400
				send ^y
				sleep 600
				xcl:=SubStr(FullFilePath,1, StrLen(FullFilePath) -4) 
				FormatTime, TimeString,, ddMMyy
				PDFPath := xcl . "_" . TimeString . ".PDF"
				if !FileExist(PDFPath)
   					MsgBox, The pdf file does not exist.
				else
				{
					;Run, %PDFPath%
				}
				run, whatsapp.py
				
			}
			*/
			oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
			NAme := "Excel.exe"
			for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
				proc.terminate()
			msgbox what is this
			ExitApp
		}

	}
	else
	{
		;tooltip, foundit
		send !n
		log("Closed 'Excel Open Dialog'`n\\\\\\\\\\\\")
		sleep 280
		WinWait, ahk_exe Excel.exe,, 1
		if ErrorLevel
		{
			;RETURN
			goto, dialog
		}
		Else
		{
			sleep 800
			oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
			NAme := "Excel.exe"
			for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
				proc.terminate()
			log("Excel opened from Marg closed`n\\\\\\\\\\\\")
			FullFilePath := legloc . tosave . ".XLS"
			if !FileExist(FullFilePath)
   				MsgBox, The excel file does not exist.
			Else	
			{
				log("XLS file created at "FullFilePath . "`n\\\\\\\\\\\\")
				Run, %FullFilePath%
				WinWait, ahk_exe Excel.exe,, 1
				if ErrorLevel
				{
					;RETURN
				}
				Else
				{
					WinActivate
				}
				;WinActivate
				sleep 1000
				send {Del}
				sleep 200
				send ^y
				;sleep 400
				;send ^y
				sleep 600
				xcl:=SubStr(FullFilePath,1, StrLen(FullFilePath) -4) 
				FormatTime, TimeString,, ddMMyy
				PDFPath := xcl . "_" . TimeString . ".PDF"
				sleep 600
				if !FileExist(PDFPath)
   					MsgBox, The pdf file does not exist.
				else
				{
					log("PDF file created at "PDFPath . "`n\\\\\\\\\\\\")
				}
				logpath(PDFPath)
				oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
				NAme := "Excel.exe"
				for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
					proc.terminate()
				log("Excel opened from script closed`n\\\\\\\\\\\\")
				;run, whatsapp.py,,hide

				run, whatsapp.py,,,pyid

				log("Python script started PID: "pyid . "`n\\\\\\\\\\\\")
				;msgbox gg
				if FileExist("*.jpg")
				{
					;FileRecycle, %A_WorkingDir%\*.jpg
					log("Deleted OCR images`n\\\\\\\\\\\\")
				}
				if FileExist(legloc . "*.XLS")
				{
					FileRecycle, %legloc%\*.XLS
					log("Deleted all .xls files`n\\\\\\\\\\\\")
				}
				Else    
					msgbox no
				ExitApp
					;FileRecycle, %A_WorkingDir%\*.XLS
			}

				
			
		}
		;ELSE XCL
		
		goto, dialog
		return
	}
	return
}
msgbox, done

lognum(msg)
{
	file := FileOpen("num.txt", "w")
	file.close()
	FileAppend, 
	(
		%msg%
	), num.txt
	return
}
logpath(msg)
{
	file1 := FileOpen("path.txt", "w")
	file1.close()
	FileAppend, 
	(
		%msg%
	), path.txt
	return
}
log(msg)
{
	FileAppend, 
	(
		%msg%`n
	), debug.log
	return
}

ResizeBitmap(pBitmap, Percentage) 
{
	NewWidth := Gdip_GetImageWidth(pBitmap)*Percentage/100, NewHeight := Gdip_GetImageHeight(pBitmap)*Percentage/100		
	pBitmap2 := Gdip_CreateBitmap(NewWidth, NewHeight)
	G2 := Gdip_GraphicsFromImage(pBitmap2), Gdip_SetSmoothingMode(G2, 4), Gdip_SetInterpolationMode(G2, 7)
	Gdip_DrawImage(G2, pBitmap, 0, 0, NewWidth, NewHeight)
	Gdip_DisposeImage(pBitmap)
	Gdip_DeleteGraphics(G2)
	return pBitmap2
}

/*
while winexist("ahk_class #32770")
{
	;WinClose ; last found window
    ;MsgBox, found
	WinActivate
    sleep 1000 ; wait for half of a second
	send {Alt Down}
	sleep 100
	send n
	send {Alt Up}
	If !(winexist("ahk_class #32770"))
	{
		continue
	}
}