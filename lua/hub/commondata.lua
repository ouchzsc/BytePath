local commondata = {}

commondata.player = { x = 50, y = -10, w = 11, h = 36,
                      hpx = 0, hpy = -25, name = "Player", team = "team1",
                      weapons = { "Shoot", "Shoot3", "Shoot2" },
                      layerMask = mod.layerMask.player,
                      imgpath = "img/player.png", jumpEnergy = mod.config.jumpEnergyMax,
                      jumpEnergyMax = mod.config.jumpEnergyMax,
                      life = 20, axMap = {}, ayMap = {},
                      isPlayer = true,
}

commondata.bullet = { timeLife = 2, v = 800, team = "team1", w = 10, h = 10, name = "bullet",
                      layerMask = mod.layerMask.playerbullet,
                      attack = 1 }

commondata.enemy = { team = "enemy", life = 10, maxVx = 100, maxVy = mod.config.maxVy,
                     hpx = 0, hpy = 10, attack = 1,
                     jumpEnergy = 0,
                     jumpEnergyMax = mod.config.jumpEnergyMax / 16,
                     layerMask = mod.layerMask.enemy, }

commondata.wall = { friction = 50, name = "Collider,f=50", iswall = true,
                    layerMask = mod.layerMask.wall, }

commondata.brick = { w = mod.config.brickSize, h = mod.config.brickSize,
                     friction = 50, name = "Collider,f=50", iswall = true, color = mod.config.yellow,
                     layerMask = mod.layerMask.wall,
                     hpx = 0, hpy = 10,
                     life = 10, }

commondata.tailparticle = { timeLife = 0.4, imgpath = "img/player.png", }
return commondata