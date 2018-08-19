local test = {}

function test.f1()
    local items, len = mod.bump.world:getItems()
    for k, entity in pairs(items) do
        if entity.name=="Player" then
            entity:removeComponent(mod.Gravity)
        end
    end
end

function test.f2()
    --local items, len = mod.bump.world:getItems()
    --for k, entity in pairs(items) do
    --    if entity.name=="Player" then
    --        entity:addComponent(mod.Gravity)
    --    end
    --end
    --mod.debug = true
end

function test.f3()
    --mod.debug = nil
    test.showPlayersComponents()
end

function test.showPlayersComponents()
    print("Player components:----------------------")
    local items, len = mod.bump.world:getItems()
    for k, entity in pairs(items) do
        if entity.name=="Player" then
            for cls,com in pairs(entity.components) do
                for name,modcls in pairs(mod) do
                    if modcls==cls then
                        print(com.isActive,name,com)
                    end
                end
                --if cls==mod.Gravity then
                --    --print(com.isActive)
                --    com:setActive(true)
                --    print("the Gravity",com)
                --end
                --if(cls==mod.Gravity and com.isActive) then
                --    print("Gravity isActive",com)
                --end
            end

        end
    end
end

function test.printDebug()
    print(string.format("memory:%dkb", collectgarbage("count")))
end

return test