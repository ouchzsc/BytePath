--local StreamMap = require "lua.common.StreamMap"
local Entity = mod.ComponentSystem:new()

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
    --for cls, com in pairs(self.components) do
    --    com:setActive(true)
    --end
    self.components:ForEach(function (cls,com)
        com:setActive(true)
    end)
end

function Entity:onDisable()
    --for cls, com in pairs(self.components) do
    --    com:setActive(false)
    --end
    self.components:ForEach(function (cls,com)
        com:setActive(false)
    end)
end

function Entity:addComponent(comCls)
    local com = comCls:new()
    com.entity = self
    --self.components[comCls] = com
    self.components:Put(comCls,com)
    if self.isActive then
        com:setActive(true)
    end
end

function Entity:removeComponent(comCls)
    --local com = self.components[comCls]
    local com = self.components:Get(comCls)
    if com then
        com:setActive(false)
        com.entity = nil
        com:destroy()
        --self.components[comCls] = nil
        self.components:Remove(comCls)
    end
end

function Entity:getComponent(comCls)
    return self.components:Get(comCls)
end

return Entity