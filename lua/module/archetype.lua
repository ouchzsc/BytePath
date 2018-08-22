local archetype = {}

archetype.bullet = { mod.GameObject, mod.RenderCircle, mod.DirMove, mod.TimeToLive, mod.Collider, mod.CollideToDeath }
archetype.camera = { mod.WorldCamera, mod.FollowTarget, mod.SyncPosition, mod.Shake }
archetype.cursor = { mod.GameObject, mod.RenderCursor, mod.FollowMouse, mod.Trigger }
archetype.ground = { mod.GameObject, mod.Render, mod.Collider }
archetype.player = { mod.GameObject, mod.Render, mod.TriggerDeath, mod.Axis1, mod.Collider, mod.AccSystem, mod.Gravity, mod.WeaponSystem }
archetype.deadbody = { mod.GameObject, mod.RenderDeathEffect1, mod.Trigger }
archetype.particle = { mod.GameObject, mod.Trigger, mod.AccSystem, mod.RenderDirVelocity, mod.AirResistance, mod.LowSpeedDeath }
return archetype