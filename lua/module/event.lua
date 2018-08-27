local SimpleEvent = mod.SimpleEvent

local event = {}
event.draw = SimpleEvent:New("draw")
event.resize = SimpleEvent:New("resize")
event.onDraw = SimpleEvent:New("onDraw")
event.onUpdate = SimpleEvent:New("onUpdate")
event.onLateUpdate = SimpleEvent:New("onLateUpdate")
event.onKeyPressed = SimpleEvent:New("onKeyPressed")
event.onDoShake = SimpleEvent:New("onDoShake")
return event