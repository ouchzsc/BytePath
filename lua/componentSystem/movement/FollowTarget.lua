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

    local shakeX = entity.shakeX or 0
    local shakeY = entity.shakeY or 0

    entity.nextX = entity.followTarget.x + (entity.followTarget.w - entity.w) / 2 + shakeX
    entity.nextY = entity.followTarget.y + (entity.followTarget.h - entity.h) / 2 + shakeY
end

return FollowTarget