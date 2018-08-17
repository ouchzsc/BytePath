local RenderCircle = mod.ComponentSystem:new()

function RenderCircle:onEnable()
    self:registerEvent(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
end

function RenderCircle:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        love.graphics.setColor(0, 1, 1)
        love.graphics.circle("fill", entity.x, entity.y, entity.w / 2)
    end
end

return RenderCircle