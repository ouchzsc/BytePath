local soundMgr = {}

soundMgr.FIRE="music/fire.ogg"
soundMgr.COLLISION="music/collision.ogg"
soundMgr.BG="music/bg.wav"
soundMgr.BOOM="music/boom.ogg"

function soundMgr.init()
    soundMgr.music={}
    soundMgr.music[soundMgr.BG] =love.audio.newSource(soundMgr.BG, "stream")
    soundMgr.music[soundMgr.BG]:setLooping(true)

    soundMgr.music[soundMgr.FIRE] = love.audio.newSource(soundMgr.FIRE, "static")
    soundMgr.music[soundMgr.COLLISION] = love.audio.newSource(soundMgr.COLLISION, "static")
    soundMgr.music[soundMgr.BOOM] = love.audio.newSource(soundMgr.BOOM, "static")
end

function soundMgr.play(name)
    local source  = soundMgr.music[name]
    love.audio.play(source:clone())
end

return soundMgr