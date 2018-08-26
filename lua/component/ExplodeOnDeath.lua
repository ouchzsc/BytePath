local ExplodeOnDeath = mod.ComponentSystem:newCls()

function ExplodeOnDeath:onEntityEvent(type)
    if type == "death" then
        self:explode(self.entity)
        mod.soundMgr.play(mod.soundMgr.BOOM)
        --mod.event.onDoShake:Trigger(mod.camMgr.cam, 0.2, 60, 15)
        --mod.timeScaleMgr.setScale(0.1, 1)
    end
end

function ExplodeOnDeath:explode(entity)
    local px, py = entity.x + entity.w / 2, entity.y + entity.h / 2
    for i = 1, 50 do
        local v = math.random(100, 800)
        local angle = math.random(0, 360)
        local particle = mod.Entity.create(mod.archetype.particle)
        particle:setData({
            x = px,
            y = py,
            w = math.random(1, 3), h = 2,
            vx = v * math.cos(angle),
            vy = v * math.sin(angle),
            airResist = math.random(800, 2000),
            color = mod.utils.randomFrom({ mod.config.blue, mod.config.blue, mod.config.yellow }) })
        particle:setActive(true)
    end
end

return ExplodeOnDeath