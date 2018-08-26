local playerMgr = {}

function playerMgr.init()
    local player = mod.Entity.create(mod.archetype.player)
    player:setData(mod.entityData.player)
    player:setActive(true)
    playerMgr.player = player
    mod.camMgr.cam:setData({ followTarget = player })
end

return playerMgr