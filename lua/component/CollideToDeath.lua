local CollideToDeath = mod.ComponentSystem:newCls()

function CollideToDeath:onPopEvent(type, data)
    if type == "onCollision" then
        self:onCollision(data)
    end
end

function CollideToDeath:onCollision(data)
    local col = data.col
    local entity = self.entity
    local other = data.other

    if mod.layerMask.collideWith(entity.layerMask, other.layerMask) then
        entity:popEvent("death", { col = col })
        entity:setActive(false)
    end
end

return CollideToDeath