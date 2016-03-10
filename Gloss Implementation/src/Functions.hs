module Functions where

import Types

increaseSpeed :: Ship -> Ship
increaseSpeed (Ship l (x, y)) = Ship l (x + 20, y + 20)

updateShip :: Ship -> Float -> Ship
updateShip (Ship (locx, locy) (speedx, speedy)) interval =
    Ship (locx + speedx * interval, locy + speedy * interval) (speedx, speedy)

rotateLeft :: Ship -> Ship
rotateLeft (Ship (x,y) s) = Ship (x * cos 2 - y * sin 2, x * sin 2 + y * cos 2) s

rotateRight :: Ship -> Ship
rotateRight (Ship (x,y) s) = Ship (x * sin 2 + y * cos 2, x * cos 2 - y * sin 2) s