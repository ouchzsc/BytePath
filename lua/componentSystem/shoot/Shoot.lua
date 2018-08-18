local Shoot = mod.ComponentSystem:new()

function Shoot:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
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
    self:scheduleTimer("fire", 0.2, function()
        entity.isFiring = false
    end)
end

function Shoot:fire()
    local entity = self.entity
    local worldCam = entity.worldCam
    if worldCam then
        local bullet = mod.Entity.create(mod.archetype.bullet)
        local entityCenterX, entityCenterY = entity.x + entity.w / 2, entity.y + entity.h / 2
        bullet:setData({ x = entityCenterX, y = entityCenterY, w = 10, h = 10, name = "bullet" })
        local mx, my = worldCam:getWorldPos(love.mouse.getX(), love.mouse.getY())
        local sx, sy = mx - entityCenterX, my - entityCenterY
        local c = math.sqrt(sx * sx + sy * sy)
        local angle = math.acos(sx / c)
        if sy > 0 then
            angle = math.pi * 2 - angle
        end
        bullet:setData({ angle = angle })
        bullet:setData({ v = 800 })
        bullet:setData({ timeLife = 2 })
        bullet:setData({ team = "team1" })
        bullet:setActive(true)
    end
end

return Shoot