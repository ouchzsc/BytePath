local test = {}

function test.f1()
    local px,py = math.random(200, 310),math.random(320, 350)
    for i = 1, 80 do
        local particle = mod.Entity.create(mod.archetype.particle)
        particle:setData({
            x = px,
            y = py,
            w = math.random(1, 5), h = 2,
            vx = math.random(-800, 800),
            vy = math.random(-800, 800),
            airResist = math.random(200, 2000)
        })
        particle:setActive(true)
    end
end

function test.f2()
end

function test.f3()
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