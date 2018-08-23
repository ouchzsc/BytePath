local Shoot3 = mod.Shoot:newCls()

function Shoot3:fire()
    local entity = self.entity
    local entityCenterX, entityCenterY = entity.x + entity.w / 2, entity.y + entity.h / 2
    local mx, my = self.cam:getWorldPos(love.mouse.getX(), love.mouse.getY())
    local sx, sy = mx - entityCenterX, my - entityCenterY
    local c = math.sqrt(sx * sx + sy * sy)
    local angle = math.acos(sx / c)
    if sy > 0 then
        angle = math.pi * 2 - angle
    end

    local bullet = mod.Entity.create(mod.archetype.bullet)
    local bullet2 = mod.Entity.create(mod.archetype.bullet)
    local bullet3 = mod.Entity.create(mod.archetype.bullet)

    local commondata = { angle = angle, timeLife = mod.config.bulletlifetime, v = mod.config.bulletVelocity, team = "team1", w = 10, h = 10, name = "bullet" }

    bullet:setData(commondata)
    bullet2:setData(commondata)
    bullet3:setData(commondata)

    bullet:setData({ x = entityCenterX, y = entityCenterY })
    bullet:setActive(true)

    local dis = 10
    local dx = dis * math.sin(angle)
    local dy = dis * math.cos(angle)
    bullet2:setData({ x = entityCenterX + dx, y = entityCenterY + dy })
    bullet2:setActive(true)

    bullet3:setData({ x = entityCenterX - dx, y = entityCenterY - dy })
    bullet3:setActive(true)
end

return Shoot3