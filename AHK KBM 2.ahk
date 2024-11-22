; Initialize directions, tick distance, and toggle state
directionX := 0
directionY := 0
tickDistance := 15
scrollDistance := 2
scriptEnabled := false

; Toggle script on/off with `
`::
scriptEnabled := !scriptEnabled
if (scriptEnabled)
{
    ; Enable hotkeys
    Hotkey, w, wHandler, On
    Hotkey, w Up, wUpHandler, On
    Hotkey, a, aHandler, On
    Hotkey, a Up, aUpHandler, On
    Hotkey, s, sHandler, On
    Hotkey, s Up, sUpHandler, On
    Hotkey, d, dHandler, On
    Hotkey, d Up, dUpHandler, On
    Hotkey, e, eHandler, On
    Hotkey, q, qHandler, On
    Hotkey, r, rHandler, On
    Hotkey, 1, 1Handler, On
    Hotkey, 2, 2Handler, On
    Hotkey, 3, 3Handler, On
    Hotkey, 4, 4Handler, On
    Hotkey, 5, 5Handler, On
    Hotkey, 6, 6Handler, On
    Hotkey, 7, 7Handler, On
    Hotkey, 8, 8Handler, On
    Hotkey, 9, 9Handler, On
    Hotkey, 0, 0Handler, On
    Hotkey, -, -Handler, On
    Hotkey, f, fHandler, On
    Hotkey, r, rHandler, On
    Hotkey, z, zHandler, On
    Hotkey, z Up, zUpHandler, On
    Hotkey, x, xHandler, On
    Hotkey, x Up, xUpHandler, On
}
else
{
    ; Disable hotkeys
    Hotkey, w, wHandler, Off
    Hotkey, w Up, wUpHandler, Off
    Hotkey, a, aHandler, Off
    Hotkey, a Up, aUpHandler, Off
    Hotkey, s, sHandler, Off
    Hotkey, s Up, sUpHandler, Off
    Hotkey, d, dHandler, Off
    Hotkey, d Up, dUpHandler, Off
    Hotkey, e, eHandler, Off
    Hotkey, q, qHandler, Off
    Hotkey, r, rHandler, Off
    Hotkey, 1, 1Handler, Off
    Hotkey, 2, 2Handler, Off
    Hotkey, 3, 3Handler, Off
    Hotkey, 4, 4Handler, Off
    Hotkey, 5, 5Handler, Off
    Hotkey, 6, 6Handler, Off
    Hotkey, 7, 7Handler, Off
    Hotkey, 8, 8Handler, Off
    Hotkey, 9, 9Handler, Off
    Hotkey, 0, 0Handler, Off
    Hotkey, -, -Handler, Off
    Hotkey, f, fHandler, Off
    Hotkey, r, rHandler, Off
    Hotkey, z, zHandler, Off
    Hotkey, z Up, zUpHandler, Off
    Hotkey, x, xHandler, Off
    Hotkey, x Up, xUpHandler, Off
}
return

; Handlers for hotkeys

wHandler:
directionY := -tickDistance
SetTimer, MoveMouse, 10
return

aHandler:
directionX := -tickDistance
SetTimer, MoveMouse, 10
return

dHandler:
directionX := tickDistance
SetTimer, MoveMouse, 10
return

sHandler:
directionY := tickDistance
SetTimer, MoveMouse, 10
return

wUpHandler:
directionY := 0
return

sUpHandler:
directionY := 0
return

aUpHandler:
directionX := 0
return

dUpHandler:
directionX := 0
return

eHandler:
Click, left
return

qHandler:
Click, right
return

2Handler:
Click, middle
return

1Handler:
tickDistance := 5
return

3Handler:
tickDistance := 10
return

4Handler:
tickDistance := 15
return

5Handler:
tickDistance := 20
return

6Handler:
tickDistance := 25
return

7Handler:
tickDistance := 30
return

8Handler:
tickDistance := 35
return

9Handler:
tickDistance := 40
return

0Handler:
tickDistance := 45
return

-Handler:
tickDistance := 50
return

rHandler:
MouseClick, WheelUp, , , %scrollDistance%
return

fHandler:
MouseClick, WheelDown, , , %scrollDistance%
return

zHandler:
Send, {Left}
return

zUpHandler:
return

xHandler:
Send, {Right}
return

xUpHandler:
return

MoveMouse:
if (directionX <> 0 or directionY <> 0)
{
    MouseMove, %directionX%, %directionY%, 0, R
}
else
{
    SetTimer, MoveMouse, Off
}
return