local CollideToDeath = mod.ComponentSystem:newCls()

function CollideToDeath:onEnable()
    self:reg(mod.event.onCollision, function(cols)
        self:onCollision(cols)
    end)
end

function CollideToDeath:onCollision(cols)
    local entity = self.entity
    for k, col in ipairs(cols) do
        if col.type ~= "cross" then
            if col.item == entity or col.other == entity then
                entity:popEvent("death", { col = col })
                entity:setActive(false)
            end
        end
    end
end

return CollideToDeath