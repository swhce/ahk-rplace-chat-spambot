Goto start

start:
Gui, Add, Text,, Amount to Spam (default is 12)
Gui, Add, Edit, vM
Gui, Add, Text,, Spam Method
Gui, Add, ComboBox, vF, aut|man
Gui, Add, StatusBar,, Bar
SB_SetText("Inactive")
Gui, Show,, ARSM by JurSecondie
spam := "@everyone "
return

F1::
SendMode, Input
Gui, Submit, NoHide
if (F = "aut")
{
Random, newseed
Random, go, 100, 150
Random, H, 0, 2147483647
o := 1
SB_SetText("Running")
loop, %M% {
loop, %go% {
Random, newseed
Random, RandTxt, 100, 150
Random, RandSay, 1, 100
Random, RS, 1, 10
Random, RandHex, 1, 16
Random, HexG, 8, 20
if (o = "1")
{
if (RandSay = "1")
{
Clipboard := spam
Send, {Ctrl down}v{Ctrl up}
sleep, 0
o := 0
}
}
loop %RandTxt%, {
send, {ASC 34 up}
send, {ASC 34 down}
sleep, 0
if RS between 1 and 2
send, {space up}{space down}
sleep, 0
}
send, {space up}{space down}
Random, H, 0, 2147483647
H .= Format("{:x}", H)
Clipboard := H
Send, {Ctrl down}v{Ctrl up}
send, {enter up}{enter down}
}
SB_SetText("Inactive")
}
else if (F = "man")
{
Random, newseed
Random, go, 100, 150
Random, H, 0, 2147483647
Send, {End down}{End up}
send, {space up}{space down}
H .= Format("{:x}", H)
Clipboard := H
Send, {Ctrl down}v{Ctrl up}
send, {enter up}{enter down}
}
return

GuiClose:
ExitApp

F2::
ListVars
return

F3::
Reload
return

F4::
Pause, Toggle
return