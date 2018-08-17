local GameObject = mod.ComponentSystem:new()
--data:x,y,w,h,name

function GameObject:onEnable()
    local entity = self.entity
    entity.x = entity.x or 0
    entity.y = entity.y or 0
    mod.bump.world:add(entity, entity.x, entity.y, entity.w, entity.h)
end

function GameObject:onDisable()
    local entity = self.entity
    mod.bump.world:remove(entity)
end

return GameObject