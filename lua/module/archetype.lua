local archetype = {}

archetype.bullet = { mod.GameObject, mod.RenderCircle, mod.DirMove, mod.TimeToLive, mod.Collider, mod.CollideToDeath }
archetype.camera = { mod.WorldCamera, mod.FollowTarget, mod.SyncPosition }
archetype.cursor = { mod.GameObject, mod.RenderCursor, mod.FollowMouse, mod.Trigger }
archetype.ground = { mod.GameObject, mod.Render, mod.Collider }
return archetype