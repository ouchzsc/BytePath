local AccSystem = mod.ComponentSystem:newCls()

function AccSystem:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function AccSystem:onUpdate(dt)
    local entity = self.entity
    if entity.axMap then
        entity.info2 = "accSystem.chase:" .. (entity.axMap.chase or "nil")
    end
    entity.axMap = entity.axMap or {}
    entity.ayMap = entity.ayMap or {}
    entity.vx = entity.vx or 0
    entity.vy = entity.vy or 0
    local maxVx, maxVy = entity.maxVx or mod.config.maxVx, entity.maxVy or mod.config.maxVy
    local ax = 0
    for k, v in pairs(entity.axMap) do
        ax = ax + v
    end



    --速度不要直接变换正负，避免摩擦力计算出错，如果经过零点则先设为0，其实Y方向也可以这么算
    local tempvx = entity.vx + ax * dt
    if tempvx * entity.vx < 0 then
        entity.vx = 0
    else
        entity.vx = tempvx
    end

    local ay = 0
    for k, v in pairs(entity.ayMap) do
        ay = ay + v
    end
    entity.vy = entity.vy + ay * dt

    if entity.vx > maxVx then
        entity.vx = maxVx
    elseif entity.vx < -maxVx then
        entity.vx = -maxVx
    end
    if entity.vy > maxVy then
        entity.vy = maxVy
    elseif entity.vy < -maxVy then
        entity.vy = -maxVy
    end

    entity.nextX = entity.x + entity.vx * dt
    entity.nextY = entity.y + entity.vy * dt
end

return AccSystem