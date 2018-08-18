local test = {}

function test.f6()

    print(math.fmod(1 - 1, 3))
    test.printDebug()
end

function test.printDebug()
    print(string.format("memory:%dkb", collectgarbage("count")))
end

return test