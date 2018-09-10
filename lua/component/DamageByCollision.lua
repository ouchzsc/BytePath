local DamageByCollision = mod.ComponentSystem:newCls()

function DamageByCollision:onPopEvent(type, data)
    if type == "onCollision" then
        self:onCollision(data)
    end
end

function DamageByCollision:onCollision(data)
    local entity = self.entity
    local other = data.other

    if other.layerMask == nil then
        return
    end

    if (entity.layerMask == nil) then
        return
    end
    -- 别人对我造成伤害
    if mod.layerMask.hurt(other.layerMask, entity.layerMask) then
        entity.life = entity.life - (other.attack or 1)
    end
end

return DamageByCollision