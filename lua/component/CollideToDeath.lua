local CollideToDeath = mod.ComponentSystem:newCls()

function CollideToDeath:onPopEvent(type, data)
    if type == "onCollision" then
        self:onCollision(data)
    end
end

function CollideToDeath:onCollision(data)
    local col = data.col
    local entity = self.entity
    if col.type ~= "cross" then
        entity:popEvent("death", { col = col })
        entity:setActive(false)
    end
end

return CollideToDeath