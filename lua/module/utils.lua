local utils = {}

function utils.getAxis1()
    local x, y = 0, 0
    if love.keyboard.isDown("w") then
        y = -1
    end
    if love.keyboard.isDown("s") then
        y = 1
    end
    if love.keyboard.isDown("d") then
        x = 1
    end
    if love.keyboard.isDown("a") then
        x = -1
    end
    return x, y
end

function utils.getAxis2()
    local x, y = 0, 0
    if love.keyboard.isDown("up") then
        y = -1
    end
    if love.keyboard.isDown("down") then
        y = 1
    end
    if love.keyboard.isDown("right") then
        x = 1
    end
    if love.keyboard.isDown("left") then
        x = -1
    end
    return x, y
end

function utils.printt(t)
    print("-----------")
    for k, v in pairs(t) do
        print(k, v)
    end
    print("\n")
end

function utils.setColor(color)
    love.graphics.setColor(color.r, color.g, color.b, color.a)
end

function utils.randomFrom(listTable)
    local count = #listTable
    if count > 0 then
        local idx = math.random(1, count)
        return listTable[idx]
    end
end

return utils