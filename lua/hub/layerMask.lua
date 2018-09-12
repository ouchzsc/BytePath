local layerMask = {}

local player, playerbullet, enemy, enemybullet, wall = 0, 1, 2, 3, 4

local function getLayerTag(layer)
    return bit.lshift(1, layer)
end

local function bitOrLayer(...)
    local c = 0
    for k, v in pairs({ ... }) do
        c = bit.bor(getLayerTag(v), c)
    end
    return c
end

function layerMask.collideWith(a, b)
    return bit.band(a.tag, b.col) ~= 0
end

function layerMask.hurt(a, b)
    return bit.band(a.dmg, b.tag) ~= 0
end

layerMask.player = {}
layerMask.player.tag = getLayerTag(player)
layerMask.player.col = bitOrLayer(wall)
layerMask.player.dmg = 0

layerMask.playerbullet = {}
layerMask.playerbullet.tag = getLayerTag(playerbullet)
layerMask.playerbullet.col = bitOrLayer(enemy, wall)
layerMask.playerbullet.dmg = bitOrLayer(enemy, wall)

layerMask.enemy = {}
layerMask.enemy.tag = getLayerTag(enemy)
layerMask.enemy.col = bitOrLayer(playerbullet, wall)
layerMask.enemy.dmg = bitOrLayer(player)

layerMask.enemybullet = {}
layerMask.enemybullet.tag = getLayerTag(enemybullet)
layerMask.enemybullet.col = bitOrLayer(player, wall)
layerMask.enemybullet.dmg = bitOrLayer(player)

layerMask.wall = {}
layerMask.wall.tag = getLayerTag(wall)
layerMask.wall.col = bitOrLayer(player, playerbullet, enemy, enemybullet, wall)
layerMask.wall.dmg = 0

return layerMask