GoTimes := 1500 ; rplace.live's cooldown appears to roughly be 2 seconds. this value will need to be lowered down during testing.

Goto start

start:
Gui, Submit, nohide
random, newseed
Random, C, 1, 25
Gui, Add, Text,, Width (Left)
Gui, Add, Edit, vGoL
Gui, Add, Text,, Width (Right)
Gui, Add, Edit, vGoR
Gui, Add, Text,, Moving Enabled?
Gui, Add, ComboBox, vM, y|n
Gui, Add, StatusBar,, Bar
SB_SetText("Inactive")
Gui, Show,, ARCB (Random Colors) by JurSecondie
return

colors:
random, newseed
Random, C, 1, 25
Array := {1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "a", 11: "b", 12: "c", 13: "d", 14: "e", 15: "f", 16: "g", 17: "h", 18: "i", 19: "j", 20: "k", 21: "l", 22: "m", 23: "n", 24: "o", 25: "p"}
RN := Array[C]
Random, GoTimes, 1500, 1800 ; randomized script cooldown trick to make the rplace.live server think it's a real human placing pixels and not just a macro that's doing it, preventing possible page reloads

F7::
Gui, Submit, nohide
Pause, Toggle
return

F6::
Gui, Submit, nohide
Reload
return

F5::
Gui, Submit, nohide
SendMode, Input
if (M = "y")
{
Loop
{
   Loop % GoL - 1
   {
gosub colors
Sleep, 100
Send, % "{" RN " down}"
Sleep, 100
Send, % "{" RN " up}"
Send, {Enter down}
Sleep, 100
Send, {Enter up}
   Sleep, %GoTimes%
Send, {Left down}
Sleep, 100
Send, {Left up}
   }
gosub colors
Sleep, 100
Send, % "{" RN " down}"
Sleep, 100
Send, % "{" RN " up}"
Send, {Enter down}
Sleep, 100
Send, {Enter up}
   Sleep, %GoTimes%
Send, {Up down}
Sleep, 100
Send, {Up up}
   Loop % GoR - 1
   {
gosub colors
Sleep, 100
Send, % "{" RN " down}"
Sleep, 100
Send, % "{" RN " up}"
Send, {Enter down}
Sleep, 100
Send, {Enter up}
   Sleep, %GoTimes%
Send, {Right down}
Sleep, 100
Send, {Right up}
   }
gosub colors
Sleep, 100
Send, % "{" RN " down}"
Sleep, 100
Send, % "{" RN " up}"
Send, {Enter down}
Sleep, 100
Send, {Enter up}
   Sleep, %GoTimes%
Send, {Up down}
Sleep, 100
Send, {Up up}
   }
}
if (M = "n")
{
Loop
{
gosub colors
Sleep, 100
Send, % "{" RN " down}"
Sleep, 100
Send, % "{" RN " up}"
Sleep, 100
Send, {Enter down}
Sleep, 100
Send, {Enter up}
Sleep, %GoTimes%
}
}
return

F8::
ListVars
return

GuiClose:
ExitApp