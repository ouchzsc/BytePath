local DamageByCollision = mod.ComponentSystem:newCls()

function DamageByCollision:onPopEvent(type, data)
    if type == "onCollison" then
        self:onCollision(data)
    end
end

function DamageByCollision:onCollision(col)
    local entity = self.entity
    local other = nil
    if col.item == entity then
        other = col.other
    else
        other = col.item
    end

    if other.colliderHurt == nil then
        return
    end
    if entity.colliderTag == nil then
        return
    end

    -- 别人对我造成伤害
    if bit.band(other.colliderHurt, entity.colliderTag) ~= 0 then
        entity.life = entity.life - (other.attack or 1)
    end
end

return DamageByCollision