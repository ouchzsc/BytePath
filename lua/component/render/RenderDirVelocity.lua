local RenderDirVelocity = mod.RenderInView:newCls()

function RenderDirVelocity:onRender()
    local entity = self.entity
    local x1, y1 = entity.x, entity.y
    local x2, y2 = entity.x - entity.vx * mod.config.particleVelocityRatio, entity.y - entity.vy * mod.config.particleVelocityRatio

    love.graphics.push()
    local olw = love.graphics.getLineWidth()
    love.graphics.setLineWidth(entity.w)
    mod.utils.setColor(entity.color)
    love.graphics.line(x1, y1, x2, y2)
    love.graphics.setLineWidth(olw)
    love.graphics.pop()
end

return RenderDirVelocity