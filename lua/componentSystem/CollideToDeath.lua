local CollideToDeath = mod.ComponentSystem:new()

function CollideToDeath:onEnable()
    self:registerEvent(mod.event.onCollision, function(cols)
        self:onCollision(cols)
    end)
end

function CollideToDeath:onCollision(cols)
    local entity = self.entity
    for k, col in ipairs(cols) do
        if col.type ~= "cross" then
            if col.item == entity or col.other == entity then
                entity:setActive(false)
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
                return
            end
        end
    end
end

return CollideToDeath