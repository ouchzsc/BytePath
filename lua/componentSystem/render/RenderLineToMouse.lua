local RenderLineToMouse = mod.ComponentSystem:newCls()

function RenderLineToMouse:onEnable()
    self:reg(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
    self.cam = mod.camMgr.cam:getComponent(mod.WorldCamera)
end

function RenderLineToMouse:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        local mx, my = self.cam:getWorldPos(love.mouse.getX(), love.mouse.getY())
        local color = mod.config.blue
        love.graphics.setColor(color.r, color.g, color.b)
        love.graphics.line(entity.x + entity.w / 2, entity.y + entity.h / 2, mx, my)
    end
end

return RenderLineToMouse