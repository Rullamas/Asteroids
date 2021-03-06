module Functions where

import Types
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Graphics.Gloss.Data.Picture

increaseSpeed :: Ship -> Ship
increaseSpeed (Ship l (x, y) o)
    | x == 0 || y == 0 = Ship l (20, 20) o
    | otherwise = Ship l (x + 20, y + 20) o

updateShip :: Ship -> Float -> Ship
updateShip (Ship (locx, locy) (speedx, speedy) outline) interval =
    Ship (locx + speedx * interval, locy + speedy * interval) (reduceSpeed speedx, reduceSpeed speedy) (updateOutline outline (speedx, speedy) interval)

updateOutline :: Outline -> Speed -> Float -> Outline
updateOutline [] _ _ = []
updateOutline ((x, y):bs) (speedx, speedy) interval =
    (x + speedx * interval, y + speedy * interval):(updateOutline bs (speedx, speedy) interval)

reduceSpeed :: Float -> Float
reduceSpeed x
    | x <= 0 = if (x + 1 >= 0) then 0 else (x + 1)
    | otherwise = if (x - 1 <= 0) then 0 else (x - 1)

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

refreshScreen :: Point -> Point
refreshScreen (x, y) = (newCoords x, newCoords y)

newCoords :: (Ord a, Num a) => a -> a
newCoords x
    | x < (-400) = 800 + x
    | x > 400    = x - 800
    | otherwise  = x

(.-) , (.+) :: Point -> Point -> Point
(x,y) .- (u,v) = (x-u,y-v)
(x,y) .+ (u,v) = (x+u,y+v)

(.*) :: Float -> Point -> Point
s .* (u,v) = (s*u,s*v)

infixl 6 .- , .+
infixl 7 .*