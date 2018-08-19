local Entity = mod.ComponentSystem:new()

function Entity.create(types)
    local entity = Entity:new()
    for k, v in pairs(types) do
        entity:addComponent(v)
    end
    return entity
end

function Entity:onNew()
    self.components = {}
end

function Entity:onEnable()
    self.__iterating = true
    for cls, com in pairs(self.components) do
        com:setActive(true)
    end
    self.__iterating = false
end

function Entity:onDisable()
    for cls, com in pairs(self.components) do
        com:setActive(false)
    end
end

function Entity:addComponent(comCls)
    local com = comCls:new()
    com.entity = self
    self.components[comCls] = com
    if com.entity.isActive then
        com:setActive(true)
    end
end

function Entity:removeComponent(comCls)
    local com = self.components[comCls]
    if com then
        com:setActive(false)
        com.entity = nil
        com:destroy()
        self.components[comCls] = nil
    end
end

return Entity