--画正弦
local Scene3 = mod.Scene:newCls()

function Scene3:onNew()
    mod.camMgr.initACam()
    mod.mouseMgr.init()
end

function Scene3:onEnable()
    self:reg(mod.event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
    self:reg(mod.event.onDraw, function(dt)
        self:onDraw()
    end)
    self:reg(mod.event.onKeyPressed, function(key)
        self:onKeyPressed(key)
    end)
    self.shaketime = 0
end

function Scene3:onKeyPressed(key)
    if key == "1" then
        self.shaketime = 0
    end
end
local hz, duration, amp = 60, 0.2, 100

function Scene3:onUpdate(dt)
    local x = mod.utils.getShakewave(hz, duration, amp, self.shaketime)
    local y = mod.utils.getShakewave(hz, duration, amp, self.shaketime)
    mod.camMgr.cam:setData({ nextX = x, nextY = y })
    self.shaketime = self.shaketime + dt
end

function Scene3:onDraw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", 400, 300, 100)
    --local pixlen = 1000
    --for i = 1, pixlen do
    --    local x = i
    --    local y = mod.utils.getShakewave(hz,duration,amp, x / pixlen)
    --    love.graphics.circle("fill", x, y + 300, 1)
    --end
end

return Scene3