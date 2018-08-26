local colliderMask = {}

local player, playerbullet, enemy, enemybullet, wall = 0, 1, 2, 3, 4

colliderMask.tag_player = bit.lshift(1, player)
colliderMask.tag_playerbullet = bit.lshift(1, playerbullet)
colliderMask.tag_enemy = bit.lshift(1, enemy)
colliderMask.tag_enemybullet = bit.lshift(1, enemybullet)
colliderMask.tag_wall = bit.lshift(1, wall)

colliderMask.mask_player = colliderMask.tag_wall
colliderMask.mask_playerbullet = bit.bor(colliderMask.tag_enemy, colliderMask.tag_wall)
colliderMask.mask_enemy = bit.bor(colliderMask.tag_playerbullet, colliderMask.tag_wall)
colliderMask.mask_enemybullet = bit.bor(colliderMask.tag_player, colliderMask.tag_wall)
colliderMask.mask_wall = bit.bor(colliderMask.tag_player,
        colliderMask.tag_playerbullet,
        colliderMask.tag_enemy,
        colliderMask.tag_enemybullet,
        colliderMask.tag_wall)

return colliderMask