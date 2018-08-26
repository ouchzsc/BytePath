local Chase = mod.ComponentSystem:newCls()

function Chase:onEnable()
    local entity = self.entity
    self:scheduleTimer("check", 1, function()
        self:check()
    end)
end

function Chase:check()
    local world =  mod.bump.world
end

return Chase