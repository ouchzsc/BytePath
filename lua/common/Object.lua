local Object = {}

function Object:new(o)
    local instance = o or {}
    setmetatable(instance, self)
    self.__index = self
    instance:onNew()
    return instance
end

function Object:onNew()
end

function Object:destroy()
    self:onDestroy()
end

function Object:onDestroy()
end

return Object