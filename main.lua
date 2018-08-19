local main = {}
main.tx, main.ty, main.scale = 0, 0, 1

function love.load()
    love.mouse.setVisible(false)
    --    love.graphics.setDefaultFilter('nearest')
    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(1)
    local _, _, mode = love.window.getMode()
    love.window.setMode(mod.config.width, mod.config.height, mode)
    mod.Scene2:new():setActive(true)
    main.dt = 0
end

function love.draw()
    local dt = main.dt

    love.graphics.push()
    love.graphics.translate(main.tx, main.ty)
    love.graphics.scale(main.scale)
    mod.event.draw:Trigger() -- camera draw
    love.graphics.pop()
end

function love.resize(w, h)
    local sx, sy = w / mod.config.width, h / mod.config.height
    if sx < sy then
        main.tx, main.ty, main.scale = 0, (h - mod.config.height * sx) / 2, sx
    else
        main.tx, main.ty, main.scale = (w - mod.config.width * sy) / 2, 0, sy
    end
    mod.event.resize:Trigger(w, h)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
        return
    end
    if key == "f1" then
        package.loaded["lua.test.test"] = nil
        local test = require "lua.test.test"
        test.f1()
    end
    if key == "f2" then
        package.loaded["lua.test.test"] = nil
        local test = require "lua.test.test"
        test.f2()
    end
    if key == "f3" then
        package.loaded["lua.test.test"] = nil
        local test = require "lua.test.test"
        test.f3()
    end
    mod.event.onKeyPressed:Trigger(key)
end

function love.update(dt)
    main.dt = dt
    mod.event.onUpdate:Trigger(dt)
    mod.Timer.globalTimer:Update(dt)
    mod.event.onLateUpdate:Trigger(dt)
end

return main