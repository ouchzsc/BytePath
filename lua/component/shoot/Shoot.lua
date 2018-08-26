local Shoot = mod.ComponentSystem:newCls()

function Shoot:onNew()
    self.cam = mod.camMgr.cam:getComponent(mod.WorldCamera)
end

function Shoot:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function Shoot:onDisable()
    self.entity.isFiring = false
end

function Shoot:onUpdate(dt)
    local entity = self.entity
    if love.mouse.isDown(1) then
        self:tryFire()
    end
end

function Shoot:tryFire()
    local entity = self.entity
    if entity.isFiring then
        return
    end
    self:fire()
    entity.isFiring = true
    self:scheduleTimer("fire", 0.1, function()
        entity.isFiring = false
    end)
end

function Shoot:fire()
    local entity = self.entity
    local bullet = mod.Entity.create(mod.archetype.bullet)
    local entityCenterX, entityCenterY = entity.x + entity.w / 2, entity.y + entity.h / 2

    local mx, my = self.cam:getWorldPos(love.mouse.getX(), love.mouse.getY())
    local sx, sy = mx - entityCenterX, my - entityCenterY
    local c = math.sqrt(sx * sx + sy * sy)
    local angle = math.acos(sx / c)
    if sy > 0 then
        angle = math.pi * 2 - angle
    end
    bullet:setData({ x = entityCenterX, y = entityCenterY, angle = angle })
    bullet:setData(mod.entityData.bullet)
    bullet:setActive(true)
end

return Shoot