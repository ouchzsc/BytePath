local RenderSprite = mod.RenderInView:newCls()

function RenderSprite:onNew()
    self.img = love.graphics.newImage("img/player.png")
end

function RenderSprite:onRender()
    local entity = self.entity
    love.graphics.draw(self.img, entity.x, entity.y)
end

return RenderSprite