local RenderTailEffect = mod.RenderInView:newCls()

function RenderTailEffect:onEnable()
    mod.RenderInView.onEnable(self)
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
    local entity = self.entity
    self.centerX = entity.x + entity.w / 2
    self.bottomY = entity.y + entity.h
    self.w = entity.w
    self.h = entity.h
end

function RenderTailEffect:onUpdate(dt)
    local entity = self.entity
    self.w = self.w - dt / self.entity.timeLife * entity.w
    self.h = self.h - dt / self.entity.timeLife * entity.h
end

function RenderTailEffect:onRender()
    local x = self.centerX - self.w / 2
    local y = self.bottomY - self.h
    mod.utils.setColor(mod.config.blue2)
    love.graphics.rectangle("line", x, y, self.w, self.h)
end

return RenderTailEffect