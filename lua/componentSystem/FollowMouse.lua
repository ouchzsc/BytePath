local FollowMouse = mod.ComponentSystem:new()

function FollowMouse:onEnable()
    self:registerEvent(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function FollowMouse:onUpdate()
    local entity = self.entity
    local worldCam = entity.worldCam
    if worldCam then
        local mx, my = worldCam:getWorldPos(love.mouse.getX(), love.mouse.getY())
        entity.nextX = mx
        entity.nextY = my
    end
end

return FollowMouse