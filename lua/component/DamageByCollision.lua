local DamageByCollision = mod.ComponentSystem:newCls()

function DamageByCollision:onEnable()
    self:reg(mod.event.onCollision, function(cols)
        self:onCollision(cols)
    end)
end

function DamageByCollision:onCollision(cols)
    local entity = self.entity
    local other = nil
    for k, col in ipairs(cols) do
        if col.item == entity or col.other == entity then
            if col.item == entity then
                other = col.other
            else
                other = col.item
            end

            if other.colliderHurt == nil then
                goto continue
            end
            if entity.colliderTag == nil then
                goto continue
            end

            -- 别人对我造成伤害
            if bit.band(other.colliderHurt, entity.colliderTag) ~= 0 then
                entity.life = entity.life - (other.attack or 1)
            end

            --我对别人造成伤害
            if bit.band(other.colliderTag, entity.colliderHurt) ~= 0 then
                if entity:getComponent(mod.DamageByCollision) then
                    other.life = other.life - (entity.attack or 1)
                end
            end

            :: continue ::
        end
    end
end

return DamageByCollision