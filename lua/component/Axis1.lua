local Axis1 = mod.ComponentSystem:newCls()

-- r: x,y,v
-- w: nextX,nextY

function Axis1:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function Axis1:onUpdate(dt)
    local entity = self.entity
    entity.axMap = entity.axMap or {}
    entity.ayMap = entity.ayMap or {}

    local x, y = mod.utils.getAxis1()

    entity.axMap.axis1 = x * mod.config.ax
    entity.ayMap.axis1 = y * mod.config.ay

end

return Axis1