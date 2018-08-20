local Gravity = mod.ComponentSystem:new()

function Gravity:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function Gravity:onUpdate(dt)
    local entity = self.entity
    entity.ayMap = entity.ayMap or {}
    entity.ayMap.gravityY = mod.config.gravity
end

function Gravity:onDisable()
    self.entity.ayMap.gravityY = nil
end

return Gravity