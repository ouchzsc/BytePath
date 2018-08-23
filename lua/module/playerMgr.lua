local playerMgr = {}

function playerMgr.init()
    local player = mod.Entity.create(mod.archetype.player)
    player:setData({ x = 0, y = 190, w = 50, h = 50 })
    player:setData({ name = "Player" })
    player:setData({ team = "team1" })
    player:setData({ weapons = { "Shoot", "Shoot3", "Shoot2" } })
    player:setActive(true)
    playerMgr.player = player
    mod.camMgr.cam:setData({ followTarget = player })
end

return playerMgr