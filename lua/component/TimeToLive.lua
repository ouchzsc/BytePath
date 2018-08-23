local TimeToLive = mod.ComponentSystem:newCls()

function TimeToLive:onEnable()
    local entity = self.entity
    self:scheduleTimer("timeToLive", entity.timeLife, function()
        entity:setActive(false)
    end)
end

return TimeToLive