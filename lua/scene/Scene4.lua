local Scene4 = mod.ComponentSystem:newCls()

function Scene4:onNew()
    mod.camMgr.init()
    mod.mouseMgr.init()
    mod.playerMgr.init()
    mod.soundMgr.init()
    mod.soundMgr.play(mod.soundMgr.BG)
    for x = 1, 50 do
        for y = 1, 50 do
            if math.random() > 0.4 then
                local brick = mod.Entity.create(mod.archetype.ground)
                brick:setData(mod.commondata.brick)
                brick:setData({ x = x * mod.config.brickSize, y = y * mod.config.brickSize })
                brick:setActive(true)
            end
        end
    end
end

return Scene4