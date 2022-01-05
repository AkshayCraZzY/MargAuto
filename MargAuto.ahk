#NoEnv    
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
#include <Vis2>
#include <Gdip_All>
ver=1.8

golecash=%A_WorkingDir%\golecash.jpg
stkisu=%A_WorkingDir%\stkisu.jpg
stkisulst=%A_WorkingDir%\stkisulst.jpg
pToken:=Gdip_Startup()
SetKeyDelay, 50
OnMessage(0x201, "WM_LBUTTONDOWN")
Gui,+AlwaysOnTop +caption +LastFound +ToolWindow
Gui, Add, GroupBox, 	x7 y4 w200 h89 , @github.com/akshaycrazzy
Gui, Add, Button, 		x12 y24 w90 h35 gStartMarg vStart, Start Marg
Gui, Add, Button, 		x111 y24 w90 h35 gButtonExit vClose, Close Marg
Gui, Add, Button, 		x111 y64 w90 h25 gReset, Reset
Gui, Add, GroupBox, 	x7 y99 w200 h50 , Functions :
Gui, Add, Radio, 		x22 y119 w70 h20 vfunct gFunc, Cash Sale
Gui, Add, Radio, 		x92 y119 w80 h20 vWhtsp gFunc, Whatsapp
Gui, Add, GroupBox, 	x7 y149 w200 h50 vBranchgrp, Branch :
Gui, Add, Radio, 		x22 y169 w50 h20 vGoleOption gBranchFunc, Gole
Gui, Add, Radio, 		x75 y169 w60 h20 vNskrdOption gBranchFunc, NskRD
Gui, Add, Radio, 		x142 y169 w55 h20 vGanjOption gBranchFunc, Ganjmal
Gui, Add, CheckBox, 	x22 y202 w180 h20 gCusDate vDateCheck , Custom Date (Skip if Yesterday)
;custdate:=A_DD-3
custdate:=A_DD-2 . "/" . A_MM
;Gui, Add, Edit, x24 y229 w170 h21 r1 vDate, %custdate%/%A_MM%
Gui, Add, Edit, x22 y222 w170 h20 r1 vDate, %custdate%
Gui, Add, Button, x32 y224 w140 h35 vExec gMain Default , Execute
Gui, Add, Text, x22 y269 w180 h60 vOutput,
;Gui, Add, Text, x22 y289 w180 h30 vOutput, Output :

Gui, Margin, 0, 10

GuiControl, Hide, Branchgrp
GuiControl, Hide, GoleOption
GuiControl, Hide, NskrdOption
GuiControl, Hide, GanjOption
GuiControl, Hide, Date
GuiControl, Hide, DateCheck
GuiControl, Hide, Exec
GuiControl, Hide, Output
Gui, Show, Autosize, MargAuto v%ver%
WinMove, A_ScreenWidth - 250
;WinSet, Transparent, 230, MargAuto
CheckRun:
{
	if not WinExist("ahk_exe margwin.exe")
	{
		GuiControl,Enable, Start
		GuiControl,Text, Close,Marg Not Running
		GuiControl,Text, Start,Start Marg
		GuiControl,Disable, Close
		RETURN
	}
	Else
	{
		GuiControl,Disable, Start
		GuiControl,Text, Start,Marg Running
		GuiControl,Text, Close,Close Marg
		GuiControl,Enable, Close
		RETURN
	}
	return
}
WM_LBUTTONDOWN() {
	PostMessage, 0xA1, 2
}

Reset:
{
	reload
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
		;msgbox yes
		Run,D:\MARGERP\margwin.exe,D:\MARGERP
		sleep 3000
		Gosub, CheckRun

		sleep 1000
		;728,735

		PixelSearch, Px, Py, 540, 745, 545, 750, 0xC8C8C8, 3, Fast
		if ErrorLevel
			MouseClick,left,845,273
		else
			Send {Enter}

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
	;;;;;msgbox, Gole stock issue  %golestcisu%
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
	oWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	NAme := "margwin.exe"
	for proc in oWMI.ExecQuery("Select * from Win32_Process Where Name = '" NAme "'")
		proc.terminate()
	sleep 1000
	Gosub, CheckRun
	;Reload
	;ExitApp
	Return
}
return

