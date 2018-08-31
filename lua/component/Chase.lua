local Chase = mod.ComponentSystem:newCls()

function Chase:onEnable()
    local entity = self.entity
    self:scheduleTimerAtFixedRate("check", 0, 2, function()
        self:check()
    end)
end

function Chase:check()
    local entity = self.entity
    local world = mod.bump.world
    local items, len = world:queryRect(entity.x, entity.y, 600, 600, function(item)
        return item.isPlayer
    end)
    entity.info = len
end

return Chase