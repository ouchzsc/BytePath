local RenderName = mod.RenderInView:newCls()

function RenderName:onRender()
    local entity = self.entity
    love.graphics.print(entity.name, entity.x, entity.y - 15)
end

return RenderName