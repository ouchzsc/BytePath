local camMgr = {}

function camMgr.init()
    camMgr.cam = mod.Entity.create(mod.archetype.camera)
    camMgr.cam:setData({ x = 0, y = 0, w = mod.config.width, h = mod.config.height, followTarget = nil })
    camMgr.cam:setActive(true)
end

function camMgr.initACam()
    camMgr.cam = mod.Entity.create({ mod.WorldCamera,  mod.SyncPosition })
    camMgr.cam:setData({ x = 0, y = 0, w = mod.config.width, h = mod.config.height, v = 150 })
    camMgr.cam:setActive(true)
end


return camMgr