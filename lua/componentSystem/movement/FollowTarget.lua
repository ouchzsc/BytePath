local FollowTarget = mod.ComponentSystem:new()

function FollowTarget:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function FollowTarget:onUpdate(dt)
    local entity = self.entity
    if entity.followTarget == nil then
        return
    end
    entity.nextX = entity.followTarget.x + (entity.followTarget.w - entity.w) / 2
    entity.nextY = entity.followTarget.y + (entity.followTarget.h - entity.h) / 2
end

return FollowTarget