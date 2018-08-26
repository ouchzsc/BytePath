--local StreamMap = require "lua.common.StreamMap"
local Entity = mod.ComponentSystem:newCls()

function Entity.create(types)
    local entity = Entity:new()
    for k, v in pairs(types) do
        entity:addComponent(v)
    end
    return entity
end

function Entity:onNew()
    self.components = mod.StreamMap:New()
end

function Entity:onEnable()
    if self.isEnable then
        return
    end
    self.isEnable = true
    self.components:ForEach(function(cls, com)
        com:setActive(true)
    end)
end

function Entity:onDisable()
    if not self.isEnable then
        return
    end
    self.isEnable = false
    self.components:ForEach(function(cls, com)
        com:setActive(false)
    end)
end

function Entity:addComponent(comCls)
    local com = comCls:new({ entity = self })
    self.components:Put(comCls, com)
    if self.isActive then
        com:setActive(true)
    end
end

function Entity:removeComponent(comCls)
    local com = self.components:Get(comCls)
    if com then
        com:setActive(false)
        com.entity = nil
        com:destroy()
        self.components:Remove(comCls)
    end
end

function Entity:getComponent(comCls)
    return self.components:Get(comCls)
end

function Entity:popEvent(eventtype, data)
    self.components:ForEach(function(cls, com)
        if com.onEntityEvent then
            com:onEntityEvent(eventtype, data)
        end
    end)
end

return Entity