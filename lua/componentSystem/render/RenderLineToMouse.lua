local RenderLineToMouse = mod.ComponentSystem:new()

function RenderLineToMouse:onEnable()
    self:registerEvent(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
end

function RenderLineToMouse:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        local worldCam = entity.worldCam
        if worldCam then
            local mx, my = worldCam:getWorldPos(love.mouse.getX(), love.mouse.getY())
            local color = mod.config.blue
            love.graphics.setColor(color.r,color.g,color.b)
            love.graphics.line(entity.x + entity.w / 2, entity.y + entity.h / 2, mx, my)
        end
    end
end

return RenderLineToMouse