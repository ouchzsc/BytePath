local DirMove = mod.ComponentSystem:newCls()

function DirMove:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function DirMove:onUpdate(dt)
    local entity = self.entity
    local dx, dy
    local angle, v = entity.angle, entity.v
    dx = v * dt * math.cos(angle)
    dy = -v * dt * math.sin(angle)
    entity.nextX = entity.x + dx
    entity.nextY = entity.y + dy
end
return DirMove