local Scene2 = mod.Scene:newCls()

function Scene2:onNew()

    mod.camMgr.init()
    mod.mouseMgr.init()
    mod.playerMgr.init()

    local down = mod.Entity.create(mod.archetype.ground)
    down:setData({ x = 0, y = 500, w = 1000, h = 50, friction = 50, name = "Collider,f=50",iswall=true })
    down:setActive(true)

    local up = mod.Entity.create(mod.archetype.ground)
    up:setData({ x = 0, y = 0, w = 1000, h = 50, friction = 50, name = "Collider,f=50",iswall=true })
    up:setActive(true)

    local left = mod.Entity.create(mod.archetype.ground)
    left:setData({ x = -50, y = 0, w = 50, h = 500, friction = 50, name = "wall,f= 50",iswall=true })
    left:setActive(true)

    local right = mod.Entity.create(mod.archetype.ground)
    right:setData({ x = 500, y = 250, w = 50, h = 250, friction = 50, name = "wall,f= 50",iswall=true })
    right:setActive(true)

end

return Scene2