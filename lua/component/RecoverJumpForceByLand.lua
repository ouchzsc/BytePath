local RecoverJumpForceByLand = mod.ComponentSystem:newCls()

function RecoverJumpForceByLand:onPopEvent(type, data)
    local entity = self.entity
    entity.jumpEnergyMax = entity.jumpEnergyMax or mod.config.jumpEnergyMax
    if type == "onCollision" then
        local col = data.col
        if col.type=="slide" and col.normal.y ~= 0 and entity.y < data.other.y then
            if entity.jumpEnergy< entity.jumpEnergyMax then
                entity.jumpEnergy = entity.jumpEnergyMax
            end
        end
    end
end

return RecoverJumpForceByLand