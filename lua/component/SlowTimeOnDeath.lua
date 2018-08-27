local SlowTimeOnDeath = mod.ComponentSystem:newCls()

function SlowTimeOnDeath:onPopEvent(type)
    if type == "death" then
        --mod.event.onDoShake:Trigger(mod.camMgr.cam, 0.2, 60, 15)
        mod.timeScaleMgr.setScale(0.1, 1)
    end
end

return SlowTimeOnDeath