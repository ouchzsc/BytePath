local TriggerDeath = mod.ComponentSystem:new()

function TriggerDeath:onEnable()
    self:registerEvent(mod.event.onKeyPressed, function(key)
        self:onKeyPressed(key)
    end)
end

function TriggerDeath:onKeyPressed(key)
    if key == "k" then
        self:explode(self.entity)
        mod.timeScaleMgr.setScale(0.2, 0.2)
    end
end

function TriggerDeath:explode(entity)
    entity:setActive(false)
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

return TriggerDeath