; Initialize directions, tick distance, and toggle state
directionX := 0
directionY := 0
tickDistance := 15
defaultTickDistance := 15
scrollDistance := 2
scriptEnabled := false
holdingClick := false ; For the V key functionality
lastTick := 0

; Timer to increase tickDistance
SetTimer, IncrementTicks, Off

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
    Hotkey, z, zHandler, On
    Hotkey, z Up, zUpHandler, On
    Hotkey, x, xHandler, On
    Hotkey, x Up, xUpHandler, On
    Hotkey, c, cHandler, On
    Hotkey, v, vHandler, On
    SetTimer, MoveMouse, 10
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
    Hotkey, z, zHandler, Off
    Hotkey, z Up, zUpHandler, Off
    Hotkey, x, xHandler, Off
    Hotkey, x Up, xUpHandler, Off
    Hotkey, c, cHandler, Off
    Hotkey, v, vHandler, Off
    SetTimer, MoveMouse, Off
    SetTimer, IncrementTicks, Off
}
return

; Handlers for WASD movement keys

wHandler:
directionY := -1
StartIncrementTimer()
return

aHandler:
directionX := -1
StartIncrementTimer()
return

dHandler:
directionX := 1
StartIncrementTimer()
return

sHandler:
directionY := 1
StartIncrementTimer()
return

wUpHandler:
directionY := 0
StopIncrementTimerIfNeeded()
return

sUpHandler:
directionY := 0
StopIncrementTimerIfNeeded()
return

aUpHandler:
directionX := 0
StopIncrementTimerIfNeeded()
return

dUpHandler:
directionX := 0
StopIncrementTimerIfNeeded()
return

; Additional functionality for other keys

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

cHandler:
Click, left
Sleep, 50
Click, left
return

vHandler:
holdingClick := !holdingClick
if (holdingClick)
{
    Click, down
}
else
{
    Click, up
}
return

; Core movement and tick adjustment functionality

MoveMouse:
currentTime := A_TickCount
if (currentTime - lastTick >= 10) ; Adjust tick interval as needed
{
    lastTick := currentTime
    if (directionX <> 0 or directionY <> 0)
    {
        MouseMove, directionX * tickDistance, directionY * tickDistance, 0, R
    }
}
return

; Timer to increment tickDistance while keys are held
IncrementTicks:
tickDistance += 2.0
return

; Start the increment timer when a key is pressed
StartIncrementTimer()
{
    SetTimer, IncrementTicks, 100
}

; Stop the increment timer and reset tickDistance if no keys are held
StopIncrementTimerIfNeeded()
{
    global directionX, directionY, tickDistance, defaultTickDistance
    if (directionX = 0 and directionY = 0)
    {
        SetTimer, IncrementTicks, Off
        tickDistance := defaultTickDistance
    }
}