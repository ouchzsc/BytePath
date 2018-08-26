local archetype = {}

archetype.bullet = { mod.GameObject, mod.RenderCircle, mod.DirMove,
                     mod.TimeToLive, mod.Collider, mod.CollideToDeath }
archetype.ground = { mod.GameObject, mod.RenderRect, mod.Collider }

archetype.player = { mod.GameObject, mod.RenderName, mod.RenderSprite,
                     mod.TriggerDeath, mod.TailEffect, mod.RenderLineToMouse,
                     mod.Axis1, mod.Collider, mod.AccSystem, mod.Gravity, mod.WeaponSystem, }
archetype.enemy = { mod.GameObject, mod.Collider, mod.RenderRect, mod.AccSystem, mod.Gravity }

archetype.camera = { mod.WorldCamera, mod.FollowTarget, mod.SyncPosition, mod.Shake }

archetype.cursor = { mod.GameObject, mod.RenderCursor, mod.FollowMouse, mod.Trigger }
archetype.deadbody = { mod.GameObject, mod.RenderDeathEffect1, mod.Trigger }

archetype.particle = { mod.GameObject, mod.Trigger, mod.AccSystem,
                       mod.RenderDirVelocity, mod.AirResistance, mod.LowSpeedDeath }

archetype.tailparticle = { mod.GameObject, mod.Trigger, mod.RenderTailEffect, mod.TimeToLive }


return archetype