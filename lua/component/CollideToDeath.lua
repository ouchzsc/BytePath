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
    local entityTag=entity.colliderTag or 0
    local otherMask = other.colliderMask or 0

    if bit.band(entityTag, otherMask)~=0 then
        entity:popEvent("death", { col = col })
        entity:setActive(false)
    end
end

return CollideToDeath