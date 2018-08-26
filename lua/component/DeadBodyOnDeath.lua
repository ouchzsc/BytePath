local DeadBodyOnDeath = mod.ComponentSystem:newCls()

function DeadBodyOnDeath:onEntityEvent(type, data)
    local entity = self.entity
    if type == "death" then
        mod.soundMgr.play(mod.soundMgr.COLLISION)

        print(entity.name,"createDeadBody")
        self:createDeadBody(data.col)
        return
    end
end

function DeadBodyOnDeath:createDeadBody(col)
    local entity = self.entity
    local normalx, normaly = col.normal.x, col.normal.y
    if col.other == entity then
        normalx, normaly = -normalx, -normaly
    end
    local rect = {}
    if normalx == -1 then
        rect.x = entity.x + entity.w / 2
        rect.y = entity.y
        rect.w = entity.w / 2
        rect.h = entity.h
    elseif normalx == 1 then
        rect.x = entity.x
        rect.y = entity.y
        rect.w = entity.w / 2
        rect.h = entity.h
    elseif normaly == -1 then
        rect.x = entity.x
        rect.y = entity.y + entity.h / 2
        rect.w = entity.w
        rect.h = entity.h / 2
    elseif normaly == 1 then
        rect.x = entity.x
        rect.y = entity.y
        rect.w = entity.w
        rect.h = entity.h / 2
    end
    local deadbody = mod.Entity.create(mod.archetype.deadbody)
    deadbody:setData({ x = rect.x, y = rect.y, w = rect.w, h = rect.h })
    deadbody:setActive(true)
end

return DeadBodyOnDeath