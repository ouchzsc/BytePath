local CollideToDeath = mod.ComponentSystem:newCls()

function CollideToDeath:onPopEvent(type, data)
    if type == "onCollison" then
        self:onCollision(data)
    end
end

function CollideToDeath:onCollision(col)
    local entity = self.entity
    if col.type ~= "cross" then
        entity:popEvent("death", { col = col })
        entity:setActive(false)
    end
end

return CollideToDeath