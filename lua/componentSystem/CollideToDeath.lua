local CollideToDeath = mod.ComponentSystem:new()

function CollideToDeath:onEnable()
    self:registerEvent(mod.event.onCollision, function(cols) self:onCollision(cols) end)
end

function CollideToDeath:onCollision(cols)
    local entity = self.entity
    for k, col in ipairs(cols) do
        if col.type ~= "cross" then
            if col.item == entity or col.other == entity then
                entity:setActive(false)
                return
            end
        end
    end
end

return CollideToDeath