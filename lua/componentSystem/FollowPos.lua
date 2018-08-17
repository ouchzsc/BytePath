local FollowPos = mod.ComponentSystem:new()

function FollowPos:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function FollowPos:onUpdate(dt)
    local entity = self.entity
    if entity.followTarget == nil then
        return
    end
    entity.nextX = entity.followTarget.x + (entity.followTarget.w - entity.w) / 2
    entity.nextY = entity.followTarget.y + (entity.followTarget.h - entity.h) / 2
end

return FollowPos