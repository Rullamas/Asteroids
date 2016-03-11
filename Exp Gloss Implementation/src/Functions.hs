module Functions where

import Types
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Graphics.Gloss.Data.Picture

-- increaseSpeed :: Ship -> Ship
-- increaseSpeed (Ship l a (x, y) o)
--     | x == 0 && y /= 0 =  if (y > 0)
--                           then (Ship l a (0, y + 20) o)
--                           else (Ship l a (0, y - 20) o)
--     | y == 0 && x/= 0 = if (y > 0)
--                         then (Ship l a (x + 20, 0) o)
--                         else (Ship l a (x - 20, 0) o)
--     | x < 0 && y < 0 = Ship l a (x - 20, y - 20) o
--     | x > 0 && y > 0 = Ship l a (x + 20, y + 20) o
--     | x > 0 && y < 0 = Ship l a (x + 20, y - 20) o
--     | x < 0 && y > 0 = Ship l a (x - 20, y + 20) o
--     | otherwise = Ship l a (0, 20) o

-- updateShip :: Ship -> Float -> Ship
-- updateShip (Ship (locx, locy) a (speedx, speedy) outline) interval =
--     Ship (locx + speedx * interval, locy + speedy * interval) a (reduceSpeed speedx, reduceSpeed speedy) (updateOutline outline (speedx, speedy) interval)

-- updateOutline :: Outline -> Speed -> Float -> Outline
-- updateOutline [] _ _ = []
-- updateOutline ((x, y):bs) (speedx, speedy) interval =
--     (x + speedx * interval, y + speedy * interval):(updateOutline bs (speedx, speedy) interval)

-- reduceSpeed :: Float -> Float
-- reduceSpeed x
--     | x <= 0 = if (x + 0.5 >= 0) then 0 else (x + 0.5)
--     | otherwise = if (x - 0.5 <= 0) then 0 else (x - 0.5)

-- rotateShip :: Angle -> Ship -> Ship
-- rotateShip newAngle (Ship loc angle speed outline) =
--     Ship loc (angle + newAngle) (rotateSingle (angle + newAngle) speed) $ map (rotateRelative angle loc) outline

-- rotateRelative :: Angle -> Origin -> Point -> Point
-- rotateRelative angle (ox, oy) (px, py) =
--     ((cos angle) * (px - ox) - (sin angle) * (py - oy) + ox,
--      (sin angle) * (px - ox) + (cos angle) * (py - oy) + oy)

rotateSingle :: Angle -> Point -> Point
rotateSingle r (x, y) = (x * cos r - y * sin r,
                         x * sin r + y * cos r)
                   
-- Revelation: Ship needs to have an angle at all times that the outline can always be deduced from.
-- This angle would also help with knowing how to increase the velocity. 

-- Hit Asteroids split into two
asteroidHit :: Asteroid -> Asteroids
asteroidHit (Asteroid loc spe siz) = [Asteroid loc (3 * rotateSingle (pi/3) spe) (siz/2)
                                    ,Asteroid loc (3 * rotateSingle (pi/3) spe) (siz/2)]




-- Ship Movement

-- This function updates both the
processMovement :: Ship -> Ship
processMovement (Ship loc angle speed picture thrust angacc) =
    Ship (calcLocation loc (polarToPoint thrust angle))
         (angle + angacc)
         (calcSpeed speed thrust angle)
         picture
         thrust
         angacc

-- Takes the pre-processed values and update the frame of reference to match.
updatePicture :: Ship -> Ship
updatePicture (Ship (x, y) angle s picture t c) =
    Ship (x, y) angle s (translate x y (rotate angle picture)) t c

thrustShip :: Thrust -> Ship -> Ship
thrustShip thrust (Ship l a s p t c) =
    updatePicture $ processMovement (Ship l a s p thrust c)

rotateShip :: AngAcc -> Ship -> Ship
rotateShip angacc (Ship l a s p t c) =
    updatePicture $ processMovement (Ship l a s p t angacc)

updateShip :: Float -> Ship -> Ship
updateShip interval ship =
    updatePicture $ processMovement ship

-- Helper Fucntions

-- Takes the location and adds in the speed but checks to see whether it would be off of the screen.
-- If so, then the location appears on opposite edge.
calcLocation :: Location -> Speed -> Location
calcLocation (x, y) (a, b) =
    (fromIntegral (mod (round (x + a)) 800) :: Float, fromIntegral (mod (round (y + b)) 800) :: Float)

-- If the speed vector's length (or magnitude) > 25, we need to cap the speed but doing so with
-- respect to the orientation.
calcSpeed :: Speed -> Thrust -> Angle -> Speed
calcSpeed speed thrust angle
    | (vecLength newSpeed) > 25 = normalize (25 / (vecLength newSpeed)) newSpeed
    | otherwise = newSpeed
    where newSpeed = addPoints (polarToPoint thrust angle) speed

-- To find the vector length (or magnitude) you add the square root of x and y squared.
vecLength :: Point -> Float
vecLength (x, y) = sqrt (x**2 + y**2)

-- To normalize a point you multiply x and y by the norm (previously calculated)
normalize :: Float -> Point -> Point
normalize norm (x, y)
    | norm == 1 = (x, y)
    | otherwise = (norm * x, norm * y)

-- This takes a length (like thrust) and an angle (like the angle of the ship) and converts it into a point
-- that can be added to the speed vector.
polarToPoint :: Float -> Angle -> Point
polarToPoint length angle = rotateSingle angle (length, 0)

-- To add two points together. Useful in calcSpeed.
addPoints :: Point -> Point -> Point
addPoints (x, y) (a, b) = (x + a, y + b)












