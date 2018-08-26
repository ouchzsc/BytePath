local entityData = {}

entityData.player = { x = 0, y = 190, w = 50, h = 50, name = "Player", team = "team1",
                      weapons = { "Shoot", "Shoot3", "Shoot2" },
                      colliderTag = mod.colliderMask.tag_player,
                      colliderMask = mod.colliderMask.mask_player }

entityData.bullet = { timeLife = 2, v = 800, team = "team1", w = 10, h = 10, name = "bullet",
                      colliderTag = mod.colliderMask.tag_playerbullet,
                      colliderMask = mod.colliderMask.mask_playerbullet }

entityData.enemy = { team = "enemy",
                     colliderTag = mod.colliderMask.tag_enemy,
                     colliderMask = mod.colliderMask.mask_enemy }

entityData.wall = { friction = 50, name = "Collider,f=50", iswall = true,
                    colliderTag = mod.colliderMask.tag_wall,
                    colliderMask = mod.colliderMask.mask_wall }

return entityData