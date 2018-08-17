local SyncPosition = mod.ComponentSystem:new()

function SyncPosition:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function SyncPosition:onUpdate(dt)
    local entity = self.entity
    entity.x = entity.nextX or entity.x
    entity.y = entity.nextY or entity.x
end

return SyncPosition