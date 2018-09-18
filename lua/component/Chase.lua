local Chase = mod.ComponentSystem:newCls()
local dtlist = { 1, 2, 1.5 }
function Chase:onEnable()
    local id = math.random(1, #dtlist)
    self.dt = dtlist[id]
    self:scheduleTimerAtFixedRate("check", 0, self.dt, function()
        self:chaseTarget()
    end)
end

function Chase:chaseTarget()
    self:findTarget()
    local entity = self.entity
    entity.axMap.chase = 0
    entity.ayMap.chase = 0
    entity.jumpEnergy = entity.jumpEnergy or 0

    local target = entity.target
    if target then
        local tx, ty = target.x, target.y
        local xDir
        --目标在左右方向则向对应的方向加速
        if target.x > entity.x then
            xDir = 1
            entity.axMap.chase = mod.config.chaseAx
        else
            xDir = -1
            entity.axMap.chase = -mod.config.chaseAx
        end

        --entity.info = string.format("target x:%d,entity x:%d,xDir:%d,chaseX:%d",
        --        target.x,entity.x,xDir,entity.axMap.chase)

        local shouldJump = false
        --目标在上方则跳跃
        if target.y < entity.y then
            shouldJump = true
        end

        --前方和下方有障碍也跳跃
        local world = mod.bump.world
        local detectW = xDir * entity.w / 4
        local _, forwardLens = world:queryRect(entity.x + detectW, entity.y, entity.w, entity.h, function(item)
            return item.layerMask == mod.layerMask.wall
        end)
        local _, bottomlens = world:queryRect(entity.x, entity.y, entity.w, entity.h * 5 / 4, function(item)
            return item.layerMask == mod.layerMask.wall
        end)
        if forwardLens > 0 and bottomlens > 0 then
            shouldJump = true
        end

        if shouldJump then
            self:doJump()
        end

        entity.info = "Chase.chase:" .. (entity.axMap.chase or nil)
    end
end

function Chase:doJump()
    local entity = self.entity
    if entity.jumpEnergy <= 0 then
        entity.ayMap.chase = 0
    else
        entity.ayMap.chase = -mod.config.chaseAy
        entity.jumpEnergy = entity.jumpEnergy - self.dt
    end
end

function Chase:findTarget()
    local entity = self.entity
    local world = mod.bump.world
    local items, len = world:queryRect(entity.x - 300, entity.y - 300, 600, 600, function(item)
        return item.isPlayer
    end)
    if len > 0 then
        entity.target = items[1]
    else
        entity.target = nil
    end
end

return Chase