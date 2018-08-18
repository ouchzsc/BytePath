local WeaponSystem = mod.ComponentSystem:new()

function WeaponSystem:onEnable()
    self:registerEvent(mod.event.onKeyPressed, function(key)
        self:onKeyPressed(key)
    end)
    local entity = self.entity
    entity.weapons = entity.weapons or { "Shoot" }
    self.index = 0
    entity:addComponent(mod[entity.weapons[self.index + 1]])
end

function WeaponSystem:onKeyPressed(key)
    local entity = self.entity
    if key == "e" then
        local removecomName = entity.weapons[self.index + 1]
        print("remove:", removecomName)
        self.entity:removeComponent(mod[removecomName])
        self.index, _ = math.mod(self.index + 1, #entity.weapons)
        print("index:", self.index)
        local addcomName = entity.weapons[self.index + 1]
        print("add:", addcomName)
        self.entity:addComponent(mod[addcomName])
    end
    if key == "q" then
        local removecomName = entity.weapons[self.index + 1]
        print("remove:", removecomName)
        self.entity:removeComponent(mod[removecomName])
        self.index, _ = math.mod(self.index + #entity.weapons - 1, #entity.weapons)
        print("index:", self.index)
        local addcomName = entity.weapons[self.index + 1]
        print("add:", addcomName)
        self.entity:addComponent(mod[addcomName])
    end
end

return WeaponSystem