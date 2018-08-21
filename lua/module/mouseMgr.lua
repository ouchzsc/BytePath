local mouseMgr = {}

function mouseMgr.init()
    local mouse = mod.Entity.create(mod.archetype.cursor)
    mouse:setData({ worldCam = mod.camMgr.cam:getComponent(mod.WorldCamera) })
    mouse:setData({ x = 0, y = 0, w = 20, h = 20, name = "mouse" })
    mouse:setActive(true)
    mouseMgr.mouse = mouse
end

return mouseMgr