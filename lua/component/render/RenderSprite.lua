local RenderSprite = mod.RenderInView:newCls()

function RenderSprite:onRender()
    local entity = self.entity
    entity.img = entity.img or love.graphics.newImage(self.entity.imgpath)
    love.graphics.draw(entity.img, entity.x, entity.y)
end

return RenderSprite