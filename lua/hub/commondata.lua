local commondata = {}

commondata.player = { x = 0, y = 190, w = 23, h = 47,
                      hpx = 0, hpy = -25,
                      name = "Player", team = "team1",
                      weapons = { "Shoot", "Shoot3", "Shoot2" },
                      colliderTag = mod.colliderMask.tag_player,
                      colliderMask = mod.colliderMask.mask_player,
                      colliderHurt = mod.colliderMask.hurt_player,
                      imgpath = "img/player.png", jumpEnergy = 0.2,
                      jumpEnergyMax = 1,
                      life = 20 }

commondata.bullet = { timeLife = 2, v = 800, team = "team1", w = 10, h = 10, name = "bullet",
                      colliderTag = mod.colliderMask.tag_playerbullet,
                      colliderMask = mod.colliderMask.mask_playerbullet,
                      colliderHurt = mod.colliderMask.hurt_playerbullet,
                      attack = 1 }

commondata.enemy = { team = "enemy", life = 10,
                     hpx = 0, hpy = -10,attack = 1,
                     colliderTag = mod.colliderMask.tag_enemy,
                     colliderMask = mod.colliderMask.mask_enemy,
                     colliderHurt = mod.colliderMask.hurt_enemy, }

commondata.wall = { friction = 50, name = "Collider,f=50", iswall = true,
                    colliderTag = mod.colliderMask.tag_wall,
                    colliderMask = mod.colliderMask.mask_wall,
                    colliderHurt = mod.colliderMask.hurt_ground, }

commondata.brick = { w = mod.config.brickSize, h = mod.config.brickSize,
                     friction = 50, name = "Collider,f=50", iswall = true,
                     colliderTag = mod.colliderMask.tag_wall,
                     colliderMask = mod.colliderMask.mask_wall, color = mod.config.yellow,
                     colliderHurt = mod.colliderMask.hurt_ground,
                     hpx = 0, hpy = 10,
                     life = 10, }

commondata.tailparticle = { timeLife = 0.4, imgpath = "img/player.png", }
return commondata