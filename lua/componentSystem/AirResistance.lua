local AirResistance = mod.ComponentSystem:new()

function AirResistance:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function AirResistance:onUpdate(dt)
    local entity = self.entity
    entity.axMap = entity.axMap or {}
    entity.ayMap = entity.ayMap or {}
    if entity.vx > 0 then
        entity.axMap.airResist = -entity.airResist
    elseif entity.vx < 0 then
        entity.axMap.airResist = entity.airResist
    else
        entity.axMap.airResist = 0
    end
    if entity.vy > 0 then
        entity.ayMap.airResist = -entity.airResist
    elseif entity.vy < 0 then
        entity.ayMap.airResist = entity.airResist
    else
        entity.ayMap.airResist = 0
    end
end

return AirResistance