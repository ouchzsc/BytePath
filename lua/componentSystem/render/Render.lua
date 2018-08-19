local Render = mod.ComponentSystem:new()

function Render:onEnable()
    self:registerEvent(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
end

function Render:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        local entity = self.entity
        local color = mod.config.defaultColor
        love.graphics.setColor(color.r, color.g, color.b)
        love.graphics.rectangle("line", entity.x, entity.y, entity.w, entity.h)
        if entity.showName then
            love.graphics.print(entity.name, entity.x, entity.y - 15)
        end
    end
end

return Render