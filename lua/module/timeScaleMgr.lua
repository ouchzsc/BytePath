local timeScaleMgr = {}

timeScaleMgr.timescale = 1

function timeScaleMgr.setScale(scale, durance)
    timeScaleMgr.timescale = scale
    mod.Timer.globalTimer:Schedule("timeScale", durance, function()
        timeScaleMgr.timescale = 1
    end)
end

return timeScaleMgr