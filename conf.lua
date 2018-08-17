local mod = require("lua.mod")
function love.conf(t)
    t.window.minwidth = mod.config.width               -- Minimum window width if the window is resizable (number)
    t.window.minheight = mod.config.height              -- Minimum window height if the window is resizable (number)
    t.window.resizable = true
    t.console=true
end