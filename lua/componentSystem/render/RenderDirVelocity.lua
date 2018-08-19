local RenderDirVelocity = mod.RenderInView:new()

function RenderDirVelocity:onRender()
    local entity = self.entity
    local x1, y1 = entity.x, entity.y
    local x2, y2 = entity.x - entity.vx * mod.config.particleVelocityRatio, entity.y - entity.vy * mod.config.particleVelocityRatio

    local olw = love.graphics.getLineWidth()
    love.graphics.setLineWidth(entity.w)
    love.graphics.line(x1, y1, x2, y2)
    love.graphics.setLineWidth(olw)
end

return RenderDirVelocity