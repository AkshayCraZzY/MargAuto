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
;SetBatchLines, -1 
;SetWinDelay -1 
SetWorkingDir %A_ScriptDir%
;#include <Vis2>
;#include <Gdip_All>
#Include <FindText>
;SetKeyDelay, 50

accname:="|<>*116$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzttzyzzzzzzzzXnzxzzzzzzzz7bzvzzzzzzzybAkkS4wzzzztiHDaPYvzzzznACTSz9bzzzziMySxkPTzzzy0kyBvAkzzzzwwZzPotVzzzzvt9irhXbzzzzbuM1jM7Dzzzzzzzzzzyzzzzzzzzzzztzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
;closemar:="|<>*130$71.zzzzzzzzzzzy0000000000000Dk600000002fzuieeeeeeeU71sM00000000Q0kk00000000k1lUT0T0DU03U031z1zUzU0600677733VU0A00AQ7A661U0M00Mk6Q0M300k00lUATUzy01U01X0MTlzw03U1X60k7n0003076A1U1a00070AAQ7A3C1U071sMQQQCC7007zUkTkTsDw003w1UT0TUDU0eeeeeeeeeeec00000000000000000000000DzzzzzzzzzzzU00000000000000000000001"
ver=1.2
Send,#d
FindSv:
{
  if FileExist("\\A1-server\d")
  {
    ;msgbox, found
  }
  Else
  {
    msgbox, 21,MargAuto v%ver% Aashirwad Agencies,Unable to connect.`nA1-SERVER
    ifMsgbox Cancel
      ExitApp
    ifMsgbox Retry
    {
      sleep 500
      Goto, FindSv
    }
  }
}


Run, C:\Users\Prafull\Desktop\A1-server.rdp

sleep 5000





t1:=A_TickCount, X:=Y:=""


if (ok:=FindText(X, Y, 723-150000, 551-150000, 723+150000, 551+150000, 0, 0, accname))
{
  FindText().Click(X, Y, "L")
  AccClick()
}
else
{
  loop,10
  {
    Send {Right down}  ; Press down the up-arrow key.
    Sleep 4  ; Keep it down for one second.
    Send {Right up} 
  }
  ;sleep 600
  if (ok:=FindText(X, Y, 723-150000, 551-150000, 723+150000, 551+150000, 0, 0, accname))
  {
    FindText().Click(X, Y, "L")
    AccClick()
  }
  Else
  {
    msgbox, Unable to find Akshay Account
  }
}

AccClick()
{
  pass1=####
  pass2=!
  pass3=#
  pass4=#
  pass5=#
  pass6=#
  pass7=####
  mar=D:\MARGERP\margwin.exe
  servscript=D:\Akshay\AHK\RUN.ahk
  ;sleep 100
  ;SetKeyDelay, 30
  
  ;msgbox, % pass
  sleep 500
  Send,{TEXT}%pass1%%pass2%%pass3%%pass4%%pass5%%pass6%%pass7%
  sleep 300
  Send {Enter}
  sleep 5000
  ;Process, Close, ServerManager.exe
  loop,5
  {
    Send,#r
    sleep 200
  }
  Send {LWin up}
	sleep 400
  Send,{TEXT}%servscript%
  sleep 700
  send {Enter}
  ;send ^+{Enter}
  ;MouseClick left,167,997
  sleep 5000
  Exitapp

  /*
  t1:=A_TickCount, X:=Y:=""
  closemar:="|<>**50$69.000000000007zzzzzzzzzzz0000000000001y0k0000000JzxLJJJJJJJEC3kk00000003UC600000000s0skDUDU7k070067z3z3zU0s00kssssQQ06006C3a3b1k0k00lkQs0k606006A1bw7zk0s00lUADszy07076A1UTa000s0slkQ0Qs003UC6C3a1b1k0D3kksssQQS00zw67z3z3zU03y0kDUDk7s0JJJJJJJJJJJE00000000000000000000004"
  if (ok:=FindText(X, Y, 758-150000, 735-150000, 758+150000, 735+150000, 0, 0, closemar))
  {
    FindText().Click(X, Y, "L")
    msgbox, %X%%Y%
  }
  Else
  {
    MsgBox, not found
  }
  */
 



  return
}

f10::exitapp
