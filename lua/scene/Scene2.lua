local Scene2 = mod.Scene:new()

function Scene2:onNew()

    local camera = mod.Entity.create(mod.archetype.camera)
    local player = mod.Entity.create(mod.archetype.player)
    player:setData({ x = 0, y = 190, w = 50, h = 50 })
    player:setData({ name = "Player" })
    player:setData({ team = "team1" })
    player:setData({ worldCam = camera.components[mod.WorldCamera] })
    player:setData({ weapons = { "Shoot", "Shoot2", "Shoot3" } })
    player:setActive(true)


    camera:setData({ x = 0, y = 0, w = mod.config.width, h = mod.config.height, followTarget = player })
    camera:setActive(true)

    local mouse = mod.Entity.create(mod.archetype.cursor)
    mouse:setData({ worldCam = camera.components[mod.WorldCamera] })
    mouse:setData({ x = 0, y = 0, w = 20, h = 20, name = "mouse" })
    mouse:setActive(true)

    local ground = mod.Entity.create(mod.archetype.ground)
    ground:setData({ x = 0, y = 500, w = 1000, h = 50, friction = 50, name = "Collider,f=50" })
    ground:setActive(true)
end

return Scene2