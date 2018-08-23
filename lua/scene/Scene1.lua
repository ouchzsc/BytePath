local Scene1 = mod.Scene:newCls()

function Scene1:onNew()



    local entity1 = mod.Entity.create({ mod.GameObject, mod.Axis1, mod.Collider, mod.AccSystem, mod.Gravity })
    entity1:setData({ x = 0, y = 190, w = 50, h = 50 })
    entity1:setData({ name = "Collider" })
    entity1:setActive(true)

    local camera = mod.Entity.create({ mod.WorldCamera, mod.Axis2, mod.SyncPosition })
    camera:setData({ x = 0, y = 0, w = mod.config.width, h = mod.config.height, v = 150 })
    camera:setActive(true)

    local entity2 = mod.Entity.create({ mod.GameObject })
    entity2:setData({ x = 150, y = 100, w = 50, h = 50, name = "Trigger" })
    entity2:setActive(true)
    entity2:addComponent(mod.Axis1)
    entity2:addComponent(mod.Trigger)

    local entity3 = mod.Entity.create({ mod.GameObject, mod.Collider })
    entity3:setData({ x = 0, y = 400, w = 400, h = 50, friction = 0, name = "Collider,f=0" })
    entity3:setActive(true)

    local entity4 = mod.Entity.create({ mod.GameObject, mod.Collider })
    entity4:setData({ x = 400, y = 400, w = 400, h = 50, friction = 50, name = "Collider,f=50" })
    entity4:setActive(true)
end

return Scene1