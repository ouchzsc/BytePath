local test = {}

function test.f1()
    local px, py = math.random(200, 310), math.random(320, 350)
    for i = 1, 50 do
        local v = math.random(100, 800)
        local angle = math.random(0, 360)
        local particle = mod.Entity.create(mod.archetype.particle)
        particle:setData({
            x = px,
            y = py,
            w = math.random(1, 3), h = 2,
            vx = v * math.cos(angle),
            vy = v * math.sin(angle),
            airResist = math.random(800, 2000),
            color = mod.utils.randomFrom({ mod.config.blue, mod.config.blue, mod.config.yellow }) })
        particle:setActive(true)
    end
end

function test.f2()
    test.printDebug()
end

function test.f3()
    local enemy = mod.Entity.create(mod.archetype.enemy)
    enemy:setData({ x = 300, y = 300, w = 40, h = 40,team="enemy" })
    enemy:setActive(true)
end

function test.showPlayersComponents()
    print("Player components:----------------------")
    local items, len = mod.bump.world:getItems()
    for k, entity in pairs(items) do
        if entity.name == "Player" then
            entity.components:ForEach(function(cls, com)
                for name, modcls in pairs(mod) do
                    if modcls == cls then
                        print(com.isActive, name, com)
                    end
                end
            end)
        end
    end
end

function test.printDebug()
    print(string.format("memory:%dkb", collectgarbage("count")))
end

return test