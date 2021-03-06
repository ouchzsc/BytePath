local archetype = {}

archetype.bullet = { mod.GameObject, mod.RenderCircle, mod.DirMove,
                     mod.TimeToLive,
                     mod.Trigger, mod.CollideToDeath, mod.DeadBodyOnDeath }

archetype.ground = { mod.GameObject, mod.RenderRect, mod.Collider, mod.RenderLife, mod.DamageByCollision,
                     mod.LowLifeDeath, mod.ExplodeOnDeath }

archetype.player = { mod.GameObject, mod.RenderInfo, mod.RenderSprite, mod.RenderLife,
                     mod.ExplodeOnDeath, mod.TailEffect, mod.RenderLineToMouse,
                     mod.ShakeCamOnDeath, mod.SlowTimeOnDeath,
                     mod.Axis1, mod.Collider, mod.AccSystem,
                     mod.RecoverJumpForceByLand, mod.DamageByCollision,
                     mod.Gravity, mod.WeaponSystem, mod.LowLifeDeath }

archetype.enemy = { mod.GameObject, mod.Collider,
                    mod.RenderRect, mod.AccSystem,
                    mod.Gravity,mod.RecoverJumpForceByLand,
                    mod.RenderLife,
                    mod.DamageByCollision,
                    mod.LowLifeDeath, mod.ExplodeOnDeath,mod.Chase,mod.RenderInfo }

archetype.camera = { mod.WorldCamera, mod.FollowTarget, mod.SyncPosition, mod.Shake }

archetype.cursor = { mod.GameObject, mod.RenderCursor, mod.FollowMouse, mod.Trigger }
archetype.deadbody = { mod.GameObject, mod.RenderDeathEffect1, mod.Trigger }

archetype.particle = { mod.GameObject, mod.Trigger, mod.AccSystem,
                       mod.RenderDirVelocity, mod.AirResistance, mod.LowSpeedDeath }

archetype.tailparticle = { mod.GameObject, mod.Trigger, mod.RenderTailEffect, mod.TimeToLive }

return archetype