#NoEnv    
#Persistent
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
#include <Vis2>
#include <Gdip_All>
ver=0.2
OnMessage(0x201, "WM_LBUTTONDOWN")
Gui,+AlwaysOnTop +caption +Border
Gui, Add, Button, x22 y9 w80 h40 gMain, Start Script
Gui, Add, Button, x112 y9 w80 h40 gButtonExit, Exit Marg
Gui, Add, CheckBox, x24 y49 w170 h30 gCusDate vMyCheckBox, Custom Date (Skip if Yesterday)
custdate:=A_DD-3
Gui, Add, Edit, x24 y79 w170 h21 r1 vDate, %custdate%/%A_MM%
GuiControl, Hide, Date
Gui, Margin, 0, 0 
Gui, Show, x361 y392 h90 w232, MargAuto v%ver%


WM_LBUTTONDOWN() {
	PostMessage, 0xA1, 2
}
WinSet, Transparent, 230, MargAuto
Return

Main:
{
Gui, submit, nohide
GuiControlGet,datee,,Date
GuiControlGet,datevis, Visible , Date


;msgbox, % datee
pToken:=Gdip_Startup()
SetKeyDelay, 50

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


golecash=%A_WorkingDir%\golecash.jpg
stkisu=%A_WorkingDir%\stkisu.jpg
stkisulst=%A_WorkingDir%\stkisulst.jpg
SLEEP 2900

;;;;;;;;;;;;;;;;;;CASH SALE


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
msgbox, Gole cash %gole%
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

msgbox, Gole stock issue  %golestcisu%
golee:=gole+golestcisu
msgbox, Total %golee%
Gdip_Shutdown(pToken)
;sleep 2000

}

CusDate:
GuiControlGet, MyCheckBox
If (MyCheckBox = 0)
{

    GuiControl, Hide, Date
    Gui, Show, h90, 
return
}
else
{
    GuiControl, show, Date
    Gui, Show, h109,
return
}


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
	ExitApp
}
return
