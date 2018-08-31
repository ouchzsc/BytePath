local RenderInfo = mod.RenderInView:newCls()

function RenderInfo:onRender()
    local entity = self.entity
    love.graphics.print(entity.info or "", entity.x, entity.y - 15)
end

return RenderInfo