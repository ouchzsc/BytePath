local RenderRect = mod.ComponentSystem:newCls()

function RenderRect:onEnable()
    self:reg(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
end

function RenderRect:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        local entity = self.entity
        local color = mod.config.blue
        love.graphics.setColor(color.r, color.g, color.b)
        love.graphics.rectangle("line", entity.x, entity.y, entity.w, entity.h)
    end
end

return RenderRect