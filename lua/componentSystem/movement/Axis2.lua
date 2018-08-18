local Axis2 = mod.ComponentSystem:new()

-- r: x,y,v
-- w: nextX,nextY

function Axis2:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function Axis2:onUpdate(dt)
    local entity = self.entity
    local x, y = mod.utils.getAxis2()
    entity.nextX, entity.nextY = entity.x + x * entity.v * dt, entity.y + y * entity.v * dt
end

return Axis2