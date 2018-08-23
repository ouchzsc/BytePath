local TailEffect = mod.ComponentSystem:newCls()

function TailEffect:onEnable()
    self:scheduleTimerAtFixedRate("taileffect", 0, 0.1, function()
        self:createTailParticle()
    end)
end

function TailEffect:createTailParticle()
    local entity = self.entity
    local minSpeed = 100
    if math.abs(entity.vx) > minSpeed or math.abs(entity.vy) > minSpeed then
        local tailpar = mod.Entity.create(mod.archetype.tailparticle)
        tailpar:setData({ x = entity.x, y = entity.y, w = entity.w, h = entity.h, timeLife = 0.4 })
        tailpar:setActive(true)
    end
end
return TailEffect