local DirMove = mod.ComponentSystem:new()

function DirMove:onEnable()
    self:registerEvent(mod.event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
end

function DirMove:onLateUpdate(dt)
    local entity = self.entity
    local dx, dy
    local angle, v = entity.angle, entity.v
    dx = v * dt * math.cos(angle)
    dy = -v * dt * math.sin(angle)
    entity.nextX = entity.x + dx
    entity.nextY = entity.y + dy
end
return DirMove