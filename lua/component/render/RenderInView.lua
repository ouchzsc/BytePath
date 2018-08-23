local RenderInView = mod.ComponentSystem:newCls()

function RenderInView:onEnable()
    self:reg(mod.event.onDraw, function(entitymap)
        self:onDraw(entitymap)
    end)
end

function RenderInView:onDraw(entitymap)
    local entity = self.entity
    if entitymap[entity] then
        if self.onRender then
            self:onRender()
        end
    end
end

return RenderInView