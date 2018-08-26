local Shoot2 = mod.Shoot:newCls()

function Shoot2:fire()
    local entity = self.entity
    local entityCenterX, entityCenterY = entity.x + entity.w / 2, entity.y + entity.h / 2
    local mx, my = self.cam:getWorldPos(love.mouse.getX(), love.mouse.getY())
    local sx, sy = mx - entityCenterX, my - entityCenterY
    local c = math.sqrt(sx * sx + sy * sy)
    local angle = math.acos(sx / c)
    if sy > 0 then
        angle = math.pi * 2 - angle
    end
    local deltaAngle = 5 * math.pi / 180
    local angle2 = angle - deltaAngle
    local angle3 = angle + deltaAngle

    local bullet = mod.Entity.create(mod.archetype.bullet)
    local bullet2 = mod.Entity.create(mod.archetype.bullet)
    local bullet3 = mod.Entity.create(mod.archetype.bullet)

    bullet:setData(mod.entityData.bullet)
    bullet2:setData(mod.entityData.bullet)
    bullet3:setData(mod.entityData.bullet)

    bullet:setData({ x = entityCenterX, y = entityCenterY, angle = angle })
    bullet:setActive(true)

    bullet2:setData({ x = entityCenterX, y = entityCenterY, angle = angle2 })
    bullet2:setActive(true)

    bullet3:setData({ x = entityCenterX, y = entityCenterY, angle = angle3 })
    bullet3:setActive(true)
end

return Shoot2