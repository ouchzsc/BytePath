local SimpleEvent = mod.SimpleEvent

local event = {}
event.draw = SimpleEvent:New("draw")
event.resize = SimpleEvent:New("resize")
event.onDraw = SimpleEvent:New("onDraw")
event.onUpdate = SimpleEvent:New("onUpdate")
event.onCollision = SimpleEvent:New("onCollision")

return event