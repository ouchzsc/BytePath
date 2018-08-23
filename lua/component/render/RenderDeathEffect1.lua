local RenderDeathEffect1 = mod.RenderInView:newCls()

local time0 = 0
local time1 = 0.1
local time2 = 0.2

function RenderDeathEffect1:onEnable()
    mod.RenderInView.onEnable(self)
    self.time = time0
    self:scheduleTimer("1", time1, function()
        self.time = time1
    end)
    self:scheduleTimer("2", time2, function()
        self.entity:setActive(false)
    end)
end

function RenderDeathEffect1:onRender()
    local entity = self.entity
    love.graphics.push()
    if self.time < time1 then
        love.graphics.setColor(0.9, 0.9, 0.9)
    elseif self.time < time2 then
        local color = mod.config.yellow
        love.graphics.setColor(color.r, color.g, color.b)
    end
    love.graphics.rectangle("fill", entity.x, entity.y, entity.w, entity.h)
    love.graphics.pop()
end

return RenderDeathEffect1