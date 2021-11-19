#NoEnv    
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
#include <Vis2>
#include <Gdip_All>
ver=1.2
golecash=%A_WorkingDir%\golecash.jpg
stkisu=%A_WorkingDir%\stkisu.jpg
stkisulst=%A_WorkingDir%\stkisulst.jpg
pToken:=Gdip_Startup()
SetKeyDelay, 50
OnMessage(0x201, "WM_LBUTTONDOWN")
Gui,+AlwaysOnTop +caption +Border
Gui, Add, GroupBox, x7 y4 w200 h89 , MargAuto v%ver% - Aashirwad Agencies
Gui, Add, Button, x12 y24 w90 h35 gStartMarg vStart, Start Marg
Gui, Add, Button, x111 y24 w90 h35 gButtonExit vClose, Close Marg
Gui, Add, Button, x111 y64 w90 h25 , Reset
Gui, Add, GroupBox, x7 y99 w200 h50 , Functions :
Gui, Add, Radio, x22 y119 w70 h20 vfunct gFunc, Cash Sale
Gui, Add, Radio, x92 y119 w80 h20 gFunc, Monthly Sale
Gui, Add, GroupBox, x7 y149 w200 h50 vBranchgrp, Branch :
Gui, Add, Radio, x22 y169 w50 h20 vGoleOption gBranchFunc, Gole
Gui, Add, Radio, x75 y169 w60 h20 vNskrdOption gBranchFunc, NskRD
Gui, Add, Radio, x142 y169 w55 h20 vGanjOption gBranchFunc, Ganjmal
Gui, Add, CheckBox, x22 y202 w180 h20 gCusDate vDateCheck , Custom Date (Skip if Yesterday)
custdate:=A_DD-3
;Gui, Add, Edit, x24 y229 w170 h21 r1 vDate, %custdate%/%A_MM%
Gui, Add, Edit, x22 y222 w170 h20 r1 vDate, %custdate%
Gui, Add, Button, x32 y224 w140 h35 vExec gMain, Execute
;Gui, Add, Button, x32 y244 w140 h35 , Execute
Gui, Add, Text, x22 y269 w180 h30 vOutput, Output :
;Gui, Add, Text, x22 y289 w180 h30 vOutput, Output :

Gui, Margin, 0, 0 

GuiControl, Hide, Branchgrp
GuiControl, Hide, GoleOption
GuiControl, Hide, NskrdOption
GuiControl, Hide, GanjOption
GuiControl, Hide, Date
GuiControl, Hide, DateCheck
GuiControl, Hide, Exec
GuiControl, Hide, Output
Gui, Show, Autosize, MargAuto
;return

if not WinExist("ahk_exe margwin.exe")
{
    GuiControl,Enable, Start
	GuiControl,Disable, Close
	RETURN
}
Else
{
    GuiControl,Disable, Start
	GuiControl,Enable, Close
	RETURN
}

WM_LBUTTONDOWN() {
	PostMessage, 0xA1, 2
}
WinSet, Transparent, 230, MargAuto
Return

;Gui, submit, nohide
GuiControlGet,datee,,Date
GuiControlGet,datevis, Visible , Date

Func:
{
	GuiControl, show, Branchgrp
	GuiControl, show, GoleOption
	GuiControl, show, NskrdOption
	GuiControl, show, GanjOption
	Gui, Show, Autosize
	return
}

BranchFunc:
{
	GuiControl, show, DateCheck
	GuiControl, show, Output
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
		GuiControl, Show, Output
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
		GuiControl, Show, Exec
		GuiControl, Show, Output
		Gui, Show, AutoSize
	return
	}
	RETURN
}


;msgbox, % datee

StartMarg:
{
GuiControl,Disable, Start
GuiControl,Enable, Close
Process,Close,ServerManager.exe
Run,D:\MARGERP\margwin.exe,D:\MARGERP
sleep 5000
MouseClick,left,758,735
sleep 800
MouseClick,left,845,273
sleep 1000
Send {Blind}akshay
sleep 200
send {Tab}
sleep 500
send {Blind}123
sleep 400
send {enter}
sleep 400
send {enter}
sleep 400
send {enter}
sleep 400
send {enter}
RETURN
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
	send {Enter}
	sleep 100
	send {Enter}
	SLEEP 200
	send {Enter}
	SLEEP 200

	send {Down}
	sleep 100
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
	SLEEP 700

	pBitmap:=Gdip_BitmapFromScreen()
	pBitmap_part:=Gdip_CloneBitmapArea(pBitmap,375,771,107,30) 
	Gdip_SaveBitmapToFile(pBitmap_part,golecash)

	;SLEEP 2000
	gole:=OCR(golecash)


	;Gdip_Shutdown(pToken)
	;;;;;;msgbox, Gole cash %gole%
	SLEEP 600
	send {Esc}
	sleep 150
	send {Esc}
	sleep 150
	SLEEP 600

	;;;;;;;;;;;;STOCK ISSUE

	send {Alt Down}
	sleep 100
	send t
	sleep 100
	send i
	sleep 100
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
	pBitmap_part:=Gdip_CloneBitmapArea(pBitmap,1104,142,120,511) 
	Gdip_SaveBitmapToFile(pBitmap_part,stkisu)

	stockissue:=OCR(stkisu)
	MyArray := StrSplit(RegExReplace(stockissue, "[^\d`n]*"), "`n")

	pBitmap:=Gdip_BitmapFromScreen()
	pBitmap_part:=Gdip_CloneBitmapArea(pBitmap,954,802,110,30) 
	Gdip_SaveBitmapToFile(pBitmap_part,stkisulst)
	stockissuelast:=OCR(stkisulst)

	MyArray.Push(stockissuelast)

	for index, val in MyArray
		if (val="")
			MyArray.RemoveAt(index)

	golestcisu=0
	for index, val in MyArray
		golestcisu:=val+golestcisu

	;;;;;msgbox, Gole stock issue  %golestcisu%
	golee:=gole+golestcisu
	send {Esc}

	GuiControl, ,Output,%golee%
	;;;;;;;msgbox, Total %golee%
	Gdip_Shutdown(pToken)
	RETURN
}
if (funct = 0)
{
	MsgBox, Monthly
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
	Reload
	;ExitApp
}
return

