local Collider = mod.ComponentSystem:newCls()

--x,y,nextX,nextY

function Collider:onEnable()
    self:reg(mod.event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
    self.entity.isCollider = true
end

function Collider:onDisable()
    self.entity.isCollider = false
end

local filter = function(item, other)
    if item.isTrigger or other.isTrigger then
        return 'cross'
    end

    if item.layerMask == nil then
        print("Tag nil", item.name)
        return 'slide'
    end

    if other.layerMask == nil then
        print("colliderMask nil", other.name)
        return 'slide'
    end

    if not mod.layerMask.collideWith(item.layerMask, other.layerMask) then
        return 'cross'
    else
        return 'slide'
    end

    if item.iswall or other.iswall then
        return 'slide'
    end
    return 'cross'
end

function Collider:onLateUpdate(dt)
    local entity = self.entity
    entity.nextX = entity.nextX or entity.x
    entity.nextY = entity.nextY or entity.y
    entity.vx = entity.vx or 0
    entity.vy = entity.vy or 0
    entity.axMap = entity.axMap or {}
    entity.axMap.fraction = 0

    local actualX, actualY, cols, len = mod.bump.world:move(entity, entity.nextX, entity.nextY, filter)
    entity:setData({ x = actualX, y = actualY })

    for i = 1, len do
        local col = cols[i]
        if col.type == 'slide' then
            --垂直阻挡
            if entity.vy > 0 and col.normal.y < 0 then
                entity.vy = 0
            elseif entity.vy < 0 and col.normal.y > 0 then
                entity.vy = 0
            end
            -- 水平阻挡
            if entity.vx > 0 and col.normal.x < 0 then
                entity.vx = 0
            elseif entity.vx < 0 and col.normal.x > 0 then
                entity.vx = 0
            end
            -- 地板摩擦力
            if entity.vx > 0 and col.normal.y < 0 then
                entity.axMap.fraction = math.min(entity.axMap.fraction, -(col.other.friction or mod.config.defaultFriction))
            elseif entity.vx < 0 and col.normal.y < 0 then
                entity.axMap.fraction = math.max(entity.axMap.fraction, col.other.friction or mod.config.defaultFriction)
            end
        end

        col.item:popEvent("onCollision", { col = col, entity = col.item, other = col.other })
        col.other:popEvent("onCollision", { col = col, entity = col.other, other = col.item })
    end
end

return Collider