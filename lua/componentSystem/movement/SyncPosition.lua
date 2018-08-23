local SyncPosition = mod.ComponentSystem:newCls()

function SyncPosition:onEnable()
    self:reg(mod.event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
end

function SyncPosition:onLateUpdate(dt)
    local entity = self.entity
    entity.x = entity.nextX or entity.x
    entity.y = entity.nextY or entity.x
end

return SyncPosition