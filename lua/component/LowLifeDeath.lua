local LowLifeDeath = mod.ComponentSystem:newCls()

function LowLifeDeath:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function LowLifeDeath:onUpdate(dt)
    local entity = self.entity

    if entity.life <= 0 then
        self.entity:popEvent("death")
        entity:setActive(false)
    end
end

return LowLifeDeath