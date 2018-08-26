local RenderLife = mod.RenderInView:newCls()

function RenderLife:onRender()
    local entity = self.entity
    love.graphics.push()
    mod.utils.setColor(mod.config.blue)
    love.graphics.print("HP:" .. entity.life, entity.x + entity.hpx, entity.y + entity.hpy)
    love.graphics.pop()
end

return RenderLife