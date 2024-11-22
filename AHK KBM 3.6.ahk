; Initialize directions, tick distance, and toggle state
directionX := 0
directionY := 0
tickDistance := 10
defaultTickDistance := 10
scrollDistance := 2
scriptEnabled := true
holdingClick := false
lastTick := 0
lastEnterPress := 0
doublePressDelay := 225

; Timer to increase tickDistance
SetTimer, IncrementTicks, Off

; Initialize the script (enable hotkeys and related functionality)
EnableHotkeys(true)

; Hotkey to toggle script on/off
]::ToggleScript()

; Function to toggle script state
ToggleScript()
{
    global scriptEnabled
    scriptEnabled := !scriptEnabled
    EnableHotkeys(scriptEnabled)
}

; Function to enable or disable hotkeys
EnableHotkeys(state)
{
    mode := state ? "On" : "Off"
    Hotkey, w, wHandler, %mode%
    Hotkey, w Up, wUpHandler, %mode%
    Hotkey, a, aHandler, %mode%
    Hotkey, a Up, aUpHandler, %mode%
    Hotkey, s, sHandler, %mode%
    Hotkey, s Up, sUpHandler, %mode%
    Hotkey, d, dHandler, %mode%
    Hotkey, d Up, dUpHandler, %mode%
    Hotkey, Return, EnterHandler, %mode%
    Hotkey, Shift, qHandler, %mode%
    Hotkey, ', rHandler, %mode%
    Hotkey, 1, 1Handler, %mode%
    Hotkey, /, 2Handler, %mode%
    Hotkey, 2, 3Handler, %mode%
    Hotkey, 3, 4Handler, %mode%
    Hotkey, 4, 5Handler, %mode%
    Hotkey, 5, 6Handler, %mode%
    Hotkey, 6, 7Handler, %mode%
    Hotkey, 7, 8Handler, %mode%
    Hotkey, 8, 9Handler, %mode%
    Hotkey, 9, 0Handler, %mode%
    Hotkey, 0, -Handler, %mode%
    Hotkey, [, fHandler, %mode%
    Hotkey, `,, zHandler, %mode%
    Hotkey, `, Up, zUpHandler, %mode%
    Hotkey, ., xHandler, %mode%
    Hotkey, . Up, xUpHandler, %mode%
    Hotkey, =, EqualHandler, %mode%
    Hotkey, #, vHandler, %mode%
    
    if (state)
    {
        ; Start timers when enabling
        SetTimer, MoveMouse, 10
    }
    else
    {
        ; Stop timers when disabling
        SetTimer, MoveMouse, Off
        SetTimer, IncrementTicks, Off
    }
}

; Handler for Enter key with double-press detection
EnterHandler:
currentTime := A_TickCount
if (currentTime - lastEnterPress <= doublePressDelay)
{
    ; Double press detected
    ToggleScript() ; Toggle script on/off
}
else
{
    ; Single press action (click)
    Click, left
}
lastEnterPress := currentTime
return

; Handler for = key to perform a double click
EqualHandler:
Click, left
Sleep, 50 ; Short delay between clicks
Click, left
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

fHandler:
MouseClick, WheelUp, , , %scrollDistance%
return

rHandler:
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
tickDistance += 4
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