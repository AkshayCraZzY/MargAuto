/*
-----------------------------------------------------
Author : Akshay Prafull Parakh
LinkedIn : https://www.linkedin.com/in/akshayparakh98
Github : https://github.com/AkshayCraZzY
Instagram : https://www.instagram.com/akki_parakh
------------------------------------------------------
*/

#NoEnv    
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
#include <Vis2>
#include <Gdip_All>
ver=2.7		;CURRENT VERSION
golecash=%A_WorkingDir%\golecash.jpg	;IMAGES FOR OCR PATHS
stkisu=%A_WorkingDir%\stkisu.jpg
stkisulst=%A_WorkingDir%\stkisulst.jpg
counter_file=%A_WorkingDir%\counter.txt
pToken:=Gdip_Startup()		;SCREENSHOT SERVICE STARTUP
SetKeyDelay, 50
;OnMessage(0x201, "WM_LBUTTONDOWN")
FileReadLine, countt, %counter_file%, 1
new_count := countt + 1
FileDelete, %counter_file%
FileAppend, %new_count%, %counter_file%
Gui,+AlwaysOnTop +Caption +LastFound +ToolWindow	;TOOLWINDOW-HIDES MAX AND MIN BUTTON FROM GUI
Gui, Font, s9 
Gui, Add, Text,			x13 y4,Load count : 
Gui, Add, Text,			x80 y4 vCounterrr gResetCounter, %new_count%    | 
Gui, Add, Link,			x112 y4,By <a href="https://github.com/AkshayCraZzY">Akshay Parakh</a>
;Gui, Add, GroupBox, 	x7 y4 w200 h89 , @Github.com/AkshayCraZzY
Gui, Font, s10 Normal
Gui, Add, Button, 		x12 y24 w90 h35 gStartMarg vStart, Start Marg
Gui, Add, Button, 		x111 y24 w90 h35 gButtonExit vClose, Close Marg
Gui, Add, Button, 		x12 y64 w90 h25 gZylem vZylemm, BD Report
Gui, Add, Button, 		x111 y64 w90 h25 gReset, Reload
Gui, Add, GroupBox, 	x7 y99 w200 h50,  Functions :
Gui, Add, Radio, 		x22 y119 w70 h20 vfunct gFunc, Sales
Gui, Add, Radio, 		x92 y119 w80 h20 vWhtsp gFunc, Whatsapp
Gui, Add, GroupBox, 	x7 y149 w200 h50 vBranchgrp, Branch :
Gui, Add, Radio, 		x22 y169 w50 h20 vGoleOption gBranchFunc, Gole

;Gui, Add, GroupBox, 	x7 y149 w200 h50 vFormatgrp, Format :
;Gui, Add, Radio, 		x22 y169 w50 h20 vExcelOption gExcelFunc, Excel

Gui, Add, Radio, 		x75 y169 w60 h20 vNskrdOption gBranchFunc, NskRD
;Gui, Add, Radio, 		x142 y169 w55 h20 vGanjOption gBranchFunc, Ganjmal
Gui, Add, CheckBox, 	x22 y202 w180 h20 gCusDate vDateCheck , Custom Date?
;custdate:=A_DD-3
custdate:=A_DD-2 . "/" . A_MM
;Gui, Add, Edit, x24 y229 w170 h21 r1 vDate, %custdate%/%A_MM%
Gui, Add, Edit, x22 y222 w170 h20 r1 vDate, %custdate%
Gui, Add, Button, x32 y224 w140 h35 vExec gMain Default , Execute
Gui, Add, Text, x12 y269 w180 h60 vOutput,
;Gui, Add, Text, x22 y289 w180 h30 vOutput, Output :

Gui, Margin, 0, 10

GuiControl, Hide, Formatgrp
GuiControl, Hide, ExcelOption
GuiControl, Hide, Branchgrp
GuiControl, Hide, GoleOption
GuiControl, Hide, NskrdOption
GuiControl, Hide, GanjOption
GuiControl, Hide, Date
GuiControl, Hide, DateCheck
GuiControl, Hide, Exec
GuiControl, Hide, Output
Gui, Show, Autosize , MargAuto v%ver%
WinMove, A_ScreenWidth - 250


;WinSet, Transparent, 230, MargAuto

CheckRun:
{
	notlogged=0
	if not WinExist("ahk_exe margwin.exe")
	{
		GuiControl,Enable, Start
		GuiControl,Text, Close,Marg Not Running
		GuiControl,Text, Start,Start Marg
		GuiControl,Disable, Close
		GuiControl,Disable, funct
		GuiControl,Disable, whtsp
		GuiControl,Disable, Zylemm
	
		RETURN
	}
	Else
	{
		GuiControl,Disable, Start
		GuiControl,Text, Start,Marg Running
		GuiControl,Text, Close,Close Marg
		GuiControl,Enable, Close
		GuiControl,Enable,funct
		GuiControl,Enable,whtsp
		GuiControl,Enable,Zylemm
		;1.875x, 1.406y
		;;1810,354
		x=1271
		y=71
		ser_x=851;1.4935
		ser_y=274;0.2591
		WinActivate
		PixelGetColor, color, %x%, %y%
		;MsgBox The color at the current cursor position is %color%.
		WinGetTitle, title,A
		If InStr(title, "AAA")
		{
			firstrun=0
		}
		Else
		{
			firstrun=1
		}
		
		
		If InStr(title, "AAA")
		{
			if (A_ScreenWidth = 1024 and A_ScreenHeight = 768 and A_Username = "Administrator")
			{
				;ser_x:=x / ratiox
				
				;ser_y:=y / ratioy
				GuiControl,Text, Zylemm,BD Report
				;msgbox, %ser_x% . %ser_y%
				;MouseMove, ser_x,ser_y
	
				PixelSearch, Px, Py, ser_x, ser_y, ser_x+2, ser_y+2, 0xDDDDDD, 1, Fast
				if ErrorLevel
					notlogged=1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				Else	
					tooltip, logged in server
				
				
			}
			Else
			{
				GuiControl,Disable, Zylemm
				GuiControl,Text, Zylemm,Server only
				PixelSearch, Px, Py, x, y, x+2, y+2, 0xDDDDDD, 1, Fast
				if ErrorLevel
					notlogged=1
				Else	
					tooltip, logged in LAPTOP
			}
			;MSGbox, % notlogged
			if (notlogged != 0)
			{
				tooltip, loggin in
				send {ctrl down}
				sleep 300
				send u
				sleep 300
				send {ctrl up}
				sleep 300
				send {Backspace}
				sleep 300
				send Akshay
				sleep 300
				send {Enter}
				sleep 300
				send 123
				sleep 300
				send {Enter}
				sleep 100
				send {Enter}
				sleep 100
				send {Enter}
				sleep 100
				send {Enter}
				sleep 100
				send {Enter}
				sleep 100
				send {Enter}
				sleep 100
				send {Enter}
			}
		}
		
		tooltip, 
		RETURN
	}


	return
}
/*
WM_LBUTTONDOWN() {
	PostMessage, 0xA1, 2
}
*/
Reset:
{
	reload
}
ResetCounter:
{
	;Gui, Font, cBlue

	GuiControl, Text, Counterrr, 1
	
	msgbox, Counter Reset Done!
	gosub, ResetCounter2
	return
}

ResetCounter2:
{
	FileDelete, %counter_file%
	FileAppend, 1, %counter_file%
	return
}
dialog:
{
		WinWait, ahk_class #32770,, 1
		if ErrorLevel
		{
			;tooltip, WinWait timed out.
			WinWait, ahk_exe Excel.exe,, 1
			if ErrorLevel
			{
				goto, dialog
				;RETURN
			}
			Else
			{
			
				if not WinExist("ahk_exe excel.exe")
				{
					;RETURN
				}
				Else
				{
					SLEEP 1000
					;tooltip, found
					WinActivate
					return
				}
				;ExitApp
			}

		}
		else
		{
			;tooltip, foundit
			send !n
			;tooltip,Closed 'Excel Open Dialog'`n\\\\\\\\\\\\
			sleep 280
			WinWait, ahk_exe Excel.exe,, 1
			if ErrorLevel
			{
				;RETURN
				goto, dialog
			}
			Else
			{
				
				
			}
			;ELSE XCL
			
			goto, dialog
			return
		}
	return
}
Zylem:
{
	yester = %a_now%
	yester += -1, days
	FormatTime, yester, %yester%, dd-MM-yy 
	
	
	Loop D:\SAPL\BECTON_1002374236\UPLOADED\*.*
	{
	 If ( A_LoopFileTimeModified >= Time )
	 {
		Time := A_LoopFileTimeModified
		File := A_LoopFileLongPath 
	 }
	}
	FormatTime, line, %Time%, dd'-'MM
	;MsgBox, %line%
	;exitapp
	;zylem_last=%A_WorkingDir%\zylem_last_date.txt
	;FileGetTime, zy_date , %zylem_last%, A
	;FormatTime, mytime , %modtime%, yyyymmddhh24
	;zylem_date=%A_WorkingDir%\zylem_last_date.txt
	;FileReadLine, line, %zylem_date%, 1
	;if ErrorLevel
	;	FileAppend,  , %zylem_date%
	InputBox, z_date, Enter Date, Please enter a date:`nLast date for backup was %line%., , 300, 150,,,,,%line%
	If ErrorLevel = 1
		Return
	MsgBox, 70,, Date is %z_date% to %yester%.,2
	IfMsgBox Cancel
	{
		Return
	}
	else IfMsgBox TryAgain
	{
		goto, Zylem
	}
	else IfMsgBox Continue
	{

	}
	
	GuiControl,Text, Zylemm,Creating Reports
	GuiControl,Disable, Zylemm
	;Gui, +Disabled
	;sleep (5000)
	;MsgBox, You entered %UserInput% as your username
	
	;exitapp
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
	}
	Else
	{
		WinActivate
	}
	;msgbox, zylem
	sleep 400
	send {Alt Down}
	sleep 300
	send r
	sleep 300
	send i
	sleep 300
	send {Enter}
	sleep 300
	send {Alt Up}
	sleep 300
	send,% z_date
	sleep 300
	send {Enter}
	sleep 300
	send, % yester
	sleep 300
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {UP}
	sleep 200
	send {Enter}
	sleep 100
	send {Down}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	;send {Enter}
	;sleep 100
	send {down}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 200
	send {down}
	sleep 100
	send {BackSpace}
	sleep 200
	send bect
	sleep 200
	send {down}
	sleep 200
	send {Enter}
	sleep 300
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 200
	send 4
	;sleep 200
	sleep 300
	send {Enter}
	sleep 300
	;exitapp
	send {Enter}
	sleep 300
	
	send {Enter}
	sleep 300
	send {Enter}
	
	gosub, dialog
	
	send {Alt Down}
	sleep 300
	send f
	sleep 300
	send a
	sleep 300
	send y
	sleep 300
	send 2
	sleep 300
	send {Alt Up}
	SLEEP 300
	SEND,  Book1_DC_%z_date%-%A_DD%
	;SEND,  MDS_%z_date%-%A_DD%
	;send {Enter}
	sleep 300
	send {Alt Down}
	sleep 300
	send s
	send {Alt Up}
	sleep 600
	oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	NAme := "Excel.exe"
	for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
		proc.terminate()
	GuiControl,Text, Zylemm,Report1 Saved
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
	}
	Else
	{
		WinActivate
	}
	;msgbox, zylem
	sleep 400
	send {Alt Down}
	sleep 300
	send r
	sleep 300
	send i
	sleep 300
	send {Enter}
	sleep 300
	send {Alt Up}
	sleep 300
	send,% z_date
	sleep 300
	send {Enter}
	sleep 300
	send, % yester
	sleep 300
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {UP}
	sleep 200
	send {Enter}
	sleep 100
	send {Down}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	;send {Enter}
	;sleep 100
	send {down}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 200
	send {down}
	sleep 100
	send {BackSpace}
	sleep 200
	send bect
	sleep 200
	;send {down}
	;sleep 200
	send {Enter}
	sleep 300
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 200
	send 4
	;sleep 200
	sleep 300
	send {Enter}
	sleep 300
	send {Enter}
	sleep 300
	send {Enter}
	sleep 300
	send {Enter}
	gosub, dialog
	send {Alt Down}
	sleep 300
	send f
	sleep 300
	send a
	sleep 300
	send y
	sleep 300
	send 2
	sleep 300
	send {Alt Up}
	SLEEP 300
	;SEND,  DC_%z_date%-%A_DD%
	SEND,  Book2_MDS_%z_date%-%A_DD%
	;send {Enter}
	sleep 300
	send {Alt Down}
	sleep 300
	send s
	send {Alt Up}
	sleep 600
	oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	NAme := "Excel.exe"
	for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
		proc.terminate()
	GuiControl,Text, Zylemm,Report2 Saved
	file := FileOpen(zylem_date, "w")
	file.close()
	FileAppend, %A_DD%, %zylem_date%
	MsgBox, 4,, Reports Created!`nContinue Upload?
	IfMsgBox Yes
		RUN, "D:\SAPL\BECTON_1002374236\Marg\DataPath"
		GuiControl,Text, Zylemm,Report Uploading
    	RunWait, D:\SAPL\BECTON_1002374236\BECTON_1002374236_ForUser_DATA_UPLOAD_BECTON.bat
	IfMsgBox No
		return
	;msgbox, debug
	
	;MsgBox, ,, Upload finished!.,5
	RUN, "D:\SAPL\BECTON_1002374236\UPLOADED"
	GuiControl,Enable, Zylemm
	GuiControl,Text, Zylemm,Zylem Report
	return
}
;Gui, submit, nohide
GuiControlGet,datee,,Date
GuiControlGet,datevis, Visible , Date

Func:
{
	Gui, Submit, NoHide
	if (whtsp)
	{
		GuiControl, hide, Branchgrp
		GuiControl, hide, GoleOption
		GuiControl, hide, NskrdOption
		GuiControl, hide, GanjOption
		GuiControl, hide, DateCheck
		GuiControl, hide, datee
		GuiControl, hide, Date
		GuiControl, Move, Exec, y150
		GuiControl, show, Exec
		Gui, Show, Autosize
	}
	if (funct)
	{
		GuiControl, hide, Exec
		GuiControl, show, Branchgrp
		GuiControl, show, GoleOption
		GuiControl, show, NskrdOption
		GuiControl, show, GanjOption
		Gui, Show, Autosize
	}

		return
}

BranchFunc:
{
	GuiControl, show, DateCheck
	;GuiControl, show, Output
	GuiControl, Move, Exec, y230
	GuiControl, show, Execute

	Gui, Show, Autosize
	return
}

CusDate:
{
	GuiControlGet, DateCheck
	If (DateCheck = 0)
	{

		GuiControl, Hide, Date
		GuiControl, Hide, Exec
		GuiControl, Hide, Output
		GuiControl, Move, Exec, y224
		GuiControl, Move, Output, y269
		GuiControl, Show, Exec
		;GuiControl, Show, Output
		;Gui, Add, Button, x32 y244 w140 h35 , Execute
		Gui, Show, AutoSize
	return
	}
	else
	{
		GuiControl, show, Date
		GuiControl, Hide, Exec
		GuiControl, Hide, Output
		GuiControl, Move, Exec, y244
		GuiControl, Move, Output, y289
		GuiControl, Focus, Date
		GuiControl, Show, Exec
		
		Gui, Show, AutoSize
	return
	}
	RETURN
}


;msgbox, % datee

StartMarg:
{
;GuiControl,Disable, Start
;GuiControl,Enable, Close
	Startmrg()
	Startmrg()
	{
		Process,Close,ServerManager.exe
		Run,D:\MARGERP\margwin.exe,D:\MARGERP
	
		sleep 3000
		Gosub, CheckRun

		sleep 1000
		;728,735
		x=540
		y=745

		;;;250,560 SERVER

		if (A_ScreenWidth = 1024 and A_ScreenHeight = 768 and A_Username = "Administrator")
		{
			PixelSearch, Px, Py, 250, 560, 255, 565, 0xC8C8C8, 3, Fast
			if ErrorLevel
				MouseClick,left,576,234
			else
				Send {Enter}
		}
		Else
		{
			PixelSearch, Px, Py, 540, 745, 545, 750, 0xC8C8C8, 3, Fast
			if ErrorLevel
				MouseClick,left,845,273
			else
				Send {Enter}	
		}

		;MouseClick,left,758,735
		;sleep 800

		sleep 1000
		Send {Blind}akshay
		sleep 200
		send {Tab}
		sleep 500
		send {Blind}123
		sleep 400
		send {enter}
		/*
		sleep 400
		send {enter}
		sleep 400
		send {enter}
		sleep 400
		send {enter}
		*/
		RETURN
	}
	return
}

SLEEP 2900

;;;;;;;;;;;;;;;;;;CASH SALE

Main:
{
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
	}
	Else
	{
		WinActivate
		;RETURN
	}
GuiControlGet,Date


StringReplace, date, date, /, /, UseErrorLevel
;msgbox, %ErrorLevel%
if(ErrorLevel==0)
{
    
    FormatTime, date,%A_YYYY%%A_MM%%date%,ddd
    if (date == "Sun")
	{
        msgbox, Entered Date is Sunday
		Run,D:\Akshay\AHK\RUN.ahk
		Exitapp
	}
    Else
        sun=0
}
else if(ErrorLevel==1)
{
    Loop, Parse, date, % "/"
    {
        ;MsgBox % "Color number " A_Index " is " A_LoopField
        if(A_Index == 1)
            Datte = % A_LoopField
            
        if(A_Index == 2)
            Montth = % A_LoopField
            
    }
    FormatTime, date,%A_YYYY%%Montth%%datte%,ddd
    if (date == "Sun")
	{
        msgbox, Entered Date is Sunday
		Run,D:\Akshay\AHK\RUN.ahk
		Exitapp
	}
    Else
        sun=0
}
else if(ErrorLevel==2)
{
    Loop, Parse, date, % "/"
    {
        if(A_Index == 1)
            Datte = % A_LoopField        
        if(A_Index == 2)
            Montth = % A_LoopField
        if(A_Index == 3)
            Yearr = % A_LoopField  
    }
	if(StrLen(Yearr)=2)
		Yearr:= Yearr+2000
	Else if(StrLen(Yearr)=3 or StrLen(Yearr)=1)
	{
		msgbox, Invalid Year
		Run,D:\Akshay\AHK\RUN.ahk
		Exitapp
	}
    FormatTime, date,%Yearr%%Montth%%datte%,ddd
    if (date == "Sun")
	{
        msgbox, Entered Date is Sunday
		Run,D:\Akshay\AHK\RUN.ahk
		Exitapp
	}
    Else
        sun=0
}
GuiControlGet,Date


GuiControlGet,datevis, Visible , Date
GuiControlGet, funct
;msgbox, % funct
if (funct = 1)
{
;MsgBox, Cash
	send {Alt Down}
	sleep 100
	send r
	sleep 100
	send s
	sleep 100
	send s
	send {Alt Up}

	If datevis=1
	{
		sleep 450
		Send {Enter}

		loop,2
		{
			send,% Date
			sleep 150
			Send {Enter}
			sleep 150
			Send {Enter}
		}
	}
	Else
	{
		IF(A_DDDD="Monday")
		{
			sleep 450
			Send {Enter}
			loop,2
			{
				send,% A_DD-2
				sleep 150
				Send {Enter}
				sleep 150
				Send {Enter}
			}

		}
		else
		{
			sleep 100
			send {Down}
			sleep 100
			send {Down}
			sleep 100
			send {Enter}
			sleep 100
			send {Enter}
			sleep 100
			send {Enter}
		}
	}




	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Enter}
	sleep 100
	send {Down}
	sleep 100
	send {Down}
	sleep 100
	/*
	send {Enter}
	sleep 100
	send {Enter}
	SLEEP 200
	send {Enter}
	SLEEP 200

	send {Down}
	sleep 100
	*/
	send {Alt Down}
	send e
	send {Alt Up}
	sleep 100
	send {Down}
	sleep 100
	send {NumpadAdd}
	sleep 100
	send {NumpadAdd}
	sleep 100
	send {NumpadAdd}
	sleep 100
	send {NumpadAdd}
	sleep 100 
	send {Enter}
	sleep 100 
	send {Enter}
	SLEEP 600
	pToken:=Gdip_Startup()
	pBitmap:=Gdip_BitmapFromScreen()
	pBitmap_part:=Gdip_CloneBitmapArea(pBitmap,375,771,107,30) 
	Gdip_SaveBitmapToFile(pBitmap_part,golecash)
	;gole:=OCR(golecash)
	clipboard := ""
	RunWait %comspec% /c  "%A_WorkingDir%\c2t\Capture2Text_CLI.exe  -i %golecash% | clip",,hide,Pid
	gole := clipboard
	gole:=RegExReplace(gole,"[^\w]","")
	G1= Gole Cash : `t`t%gole%`n
	GuiControl, ,Output,%G1%
	GuiControl, MoveDraw, Output, h20
	GuiControl, Show, Output
	GUI,SHOW,AutoSize
	;SLEEP 300
	;MsgBox, K
	;GUI,+LastFound
	;Gui,Show,AutoSize,MargAuto
	;Gdip_Shutdown(pToken)
	;msgbox, Gole cash %gole%
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
	}
	Else
	{
		WinActivate
		;RETURN
	}
	;SLEEP 600
	send {Esc}
	sleep 150
	send {Esc}
	sleep 150
	;SLEEP 600

	;;;;;;;;;;;;STOCK ISSUE

	send {Alt Down}
	sleep 200
	send t
	sleep 200
	send i
	sleep 200
	send m
	send {Alt Up}
	sleep 150
	Send {Enter}
	If datevis=1
	{
		sleep 450
		Send {Enter}
			loop,2
			{
				send,% Date
				sleep 250
				Send {Enter}
			}
	}
	Else
	{
		IF(A_DDDD="Monday")
		{
			sleep 450
			Send {Enter}
			loop,2
			{
				send,% A_DD-2
				sleep 150
				Send {Enter}
			}
		}
		else
		{
			sleep 400
			send {Down}
			sleep 100
			send {Down}
			sleep 100
			send {Enter}
		}
	}

	sleep 100
	send {Enter}
	sleep 150
	send {Down}
	sleep 100
	send {Enter}
	sleep 300
	;MSGBOX, CONTINUE?
	pBitmap:=Gdip_BitmapFromScreen()
	stckissueimg:=Gdip_CloneBitmapArea(pBitmap,1104,142,120,511) 
	stckissuelstimg:=Gdip_CloneBitmapArea(pBitmap,954,802,110,30) 
	Gdip_SaveBitmapToFile(stckissueimg,stkisu)
	Gdip_SaveBitmapToFile(stckissuelstimg,stkisulst)
	stockissue:=OCR(stkisu)
	
	/*
	clipboard := ""
	RunWait %comspec% /c  "%A_WorkingDir%\c2t\Capture2Text_CLI.exe  -i %stkisu% | clip",,hide,Pid
	stockissue := clipboard
	stockissue:=RegExReplace(stockissue,"[^\w]","")		
	*/


	MyArray := StrSplit(RegExReplace(stockissue, "[^\d`n]*"), "`n")

	;pBitmap:=Gdip_BitmapFromScreen()

	;Gdip_SaveBitmapToFile(pBitmap_part,stkisulst)


	;stockissuelast:=OCR(stkisulst)
	
	clipboard := ""
	RunWait %comspec% /c  "%A_WorkingDir%\c2t\Capture2Text_CLI.exe  -i %stkisulst% | clip",,hide,Pid
	stockissuelast := clipboard
	stockissuelast:=RegExReplace(stockissuelast,"[^\w]","")
	

	MyArray.Push(stockissuelast)

	for index, val in MyArray
		if (val="")
			MyArray.RemoveAt(index)

	golestcisu=0
	for index, val in MyArray
		golestcisu:=val+golestcisu
	G2=%G1%Gole Stock Issue : `t%golestcisu%`n
	;GuiControl, ,Output,Gole Colony Stock Issue : %golestcisu%
	;Msgbox, Gole stock issue  %golestcisu%
	golee:=gole+golestcisu
	SLEEP 300
	send {Esc}
	SLEEP 300
	send {Esc}
	G3= %G2%TOTAL : `t`t%golee%
	;GuiControl, ,Output,%G3%
	;SLEEP 500
	;msgbox, Total %golee%
	;newsize=
	
	;Gui, Show,, MargAuto
	GuiControl, ,Output,%G3%
	GuiControl, MoveDraw, Output, h48
	Gui, Show, AutoSize
	
	Gdip_Shutdown(pToken)
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
	}
	Else
	{
		WinActivate
		;RETURN
	}


	RETURN
}
if (funct = 0)
{
	;msgbox whatsapp
	RunWait,whatsapp.ahk
	return
}

}
;sleep 2000




GuiEscape:
GuiClose:
{
	ExitApp
}
Return

ButtonExit:
{
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN	
	}
	Else
	{
		WinActivate
		send ^q	
	}
	
	sleep 1000
	Gosub, CheckRun
	/*
	oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	NAme := "margwin.exe"
	for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
		proc.terminate()
	sleep 3000
	Gosub, CheckRun
	
	;Reload
	;ExitApp
	*/
	if not WinExist("ahk_exe margwin.exe")
	{
		;RETURN
		send ^q

	
	}
	Else
	{
		WinActivate
		send ^q
		
	}

	Return
}
return

