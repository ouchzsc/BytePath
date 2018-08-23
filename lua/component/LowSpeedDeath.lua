local LowSpeedDeath = mod.ComponentSystem:newCls()

function LowSpeedDeath:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function LowSpeedDeath:onUpdate(dt)
    local entity = self.entity
    local speed = entity.vx * entity.vx + entity.vy * entity.vy
    if speed < mod.config.lowSpeedSq then
        entity:setActive(false)
    end
end

return LowSpeedDeath