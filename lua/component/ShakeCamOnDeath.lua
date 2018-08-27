local ShakeCamOnDeath = mod.ComponentSystem:newCls()

function ShakeCamOnDeath:onPopEvent(type)
    if type == "death" then
        mod.event.onDoShake:Trigger(mod.camMgr.cam, 0.2, 60, 15)
    end
end

return ShakeCamOnDeath