local Shake = mod.ComponentSystem:newCls()

function Shake:onEnable()
    self:reg(mod.event.onDoShake, function(entity, duration, frenquency, amp)
        if entity == self.entity then
            self:doShake(duration, frenquency, amp)
        end
    end)
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
    self.duration = 0
    self.frenquency = 0
    self.amp = 0
    self.shaketime = 0
    self.randomX, self.randomY = 0, 0
end

function Shake:doShake(duration, frenquency, amp)
    self.duration = duration
    self.frenquency = frenquency
    self.amp = amp
    self.shaketime = 0
    self.randomX, self.randomY = math.random() * 2 * math.pi, math.random() * 2 * math.pi
end

function Shake:onUpdate(dt)
    local entity = self.entity
    local x = mod.utils.getShakewave(self.frenquency, self.duration, self.amp, self.shaketime,self.randomX)
    local y = mod.utils.getShakewave(self.frenquency, self.duration, self.amp, self.shaketime,self.randomY)
    entity:setData({ shakeX = x, shakeY = y })

    if self.shaketime < self.duration then
        self.shaketime = self.shaketime + dt
    end
end

return Shake