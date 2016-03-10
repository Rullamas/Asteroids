module Functions where

import Types
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Graphics.Gloss.Data.Picture

increaseSpeed :: Ship -> Ship
increaseSpeed (Ship l (x, y) o) = Ship l (x + 20, y + 20) o

updateShip :: Ship -> Float -> Ship
updateShip (Ship (locx, locy) (speedx, speedy) outline) interval =
    Ship (locx + speedx * interval, locy + speedy * interval) (speedx, speedy) outline

rotateLeft :: Ship -> Ship
rotateLeft (Ship loc s outline) = Ship (rotateL loc) s $ map rotateL outline

rotateRight :: Ship -> Ship
rotateRight (Ship loc s outline) = Ship (rotateR loc) s $ map rotateR outline

rotateL :: Point -> Point
rotateL (x, y) = (x * cos 0.3 - y * sin 0.3, x * sin 0.3 + y * cos 0.3)

rotateR :: Point -> Point
rotateR (x, y) = (x * cos (-0.3) - y * sin (-0.3), x * sin (-0.3) + y * cos (-0.3))

rotateB :: Float -> Point -> Point
rotateB r (x, y) = (x * cos r - y * sin r
                   ,x * sin r + y * cos r)
                   
-- Revelation: Ship needs to have an angle at all times that the outline can always be deduced from.
-- This angle would also help with knowing how to increase the velocity. 

-- Hit Asteroids split into two
asteroidHit :: Asteroid -> [Asteroid]
asteroidHit (Asteroid loc spe siz) = [Asteroid loc (3 * rotateB (pi/3) spe) (siz/2)
                                    ,Asteroid loc (3 * rotateB (pi/3) spe) (siz/2)]