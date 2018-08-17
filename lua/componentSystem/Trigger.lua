local Trigger = mod.ComponentSystem:new()

function Trigger:onEnable()
    self:registerEvent(mod.event.onUpdate, function()
        self:onUpdate(dt)
    end)
end

function Trigger:onUpdate(dt)
    local entity = self.entity
    entity.x = entity.nextX or entity.x
    entity.y = entity.nextY or entity.y
    mod.bump.world:update(entity, entity.x, entity.y)
end

return Trigger