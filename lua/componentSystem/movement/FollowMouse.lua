local FollowMouse = mod.ComponentSystem:newCls()

function FollowMouse:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
    self.cam = mod.camMgr.cam:getComponent(mod.WorldCamera)
end

function FollowMouse:onUpdate()
    local entity = self.entity
    local mx, my = self.cam:getWorldPos(love.mouse.getX(), love.mouse.getY())
    entity.nextX = mx
    entity.nextY = my
end

return FollowMouse