local WorldCamera = mod.ComponentSystem:newCls()

function WorldCamera:onNew()
    self.mw, self.mh = 0, 0
end

function WorldCamera:onEnable()
    self:reg(mod.event.draw, function()
        self:draw()
    end)
    self:reg(mod.event.resize, function(w, h)
        self:resize(w, h)
    end)
end

function WorldCamera:draw()
    local entity = self.entity
    love.graphics.setBackgroundColor(0, 0.5, 0.7)
    --View裁剪，bump始终使用世界坐标系,跟graphics的坐标系无关
    local items, len = mod.bump.world:queryRect(entity.x, entity.y, entity.w, entity.h)
    love.graphics.print(string.format("obj in view:%d\nCamX:%d,CamY:%d", len,entity.x,entity.y))
    love.graphics.push()
    love.graphics.translate(-entity.x, -entity.y)
    --世界坐标系
    local entityMap = {}
    for i = 1, len do
        entityMap[items[i]] = true
    end
    mod.event.onDraw:Trigger(entityMap)
    love.graphics.pop()
    --相机坐标系
    self:drawMask()
end

function WorldCamera:resize(w, h)
    local sx, sy = w / mod.config.width, h / mod.config.height
    if sx < sy then
        self.mw, self.mh = w, (h - mod.config.height) / 2
    else
        self.mw, self.mh = (w - mod.config.width) / 2, h
    end
end

function WorldCamera:drawMask()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, -self.mw, self.mh)
    love.graphics.rectangle("fill", mod.config.width, 0, self.mw, self.mh)
    love.graphics.rectangle("fill", 0, 0, self.mw, -self.mh)
    love.graphics.rectangle("fill", 0, mod.config.height, self.mw, self.mh)
end

function WorldCamera:getWorldPos(screenX, screenY)
    local x, y
    x = (screenX - mod.main.tx) / mod.main.scale + self.entity.x
    y = (screenY - mod.main.ty) / mod.main.scale + self.entity.y
    return x, y
end

return WorldCamera