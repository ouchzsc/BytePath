local Trigger = mod.ComponentSystem:newCls()

function Trigger:onEnable()
    self:reg(mod.event.onLateUpdate, function()
        self:onLateUpdate(dt)
    end)
    self.entity.isTrigger = true
end

function Trigger:onDisable()
    self.entity.isTrigger = nil
end

function Trigger:onLateUpdate(dt)
    local entity = self.entity
    entity.x = entity.nextX or entity.x
    entity.y = entity.nextY or entity.y
    mod.bump.world:update(entity, entity.x, entity.y)
end

return Trigger