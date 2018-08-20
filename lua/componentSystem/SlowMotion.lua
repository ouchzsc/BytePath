local SlowMotion = mod.ComponentSystem:new()

function SlowMotion:onEnable()
    print("slow")
    mod.config.timeScale = 0.1
    self:scheduleTimer("slowMo", 5, function()
        mod.config.timeScale = 1
        print("back")
    end)
end

return SlowMotion