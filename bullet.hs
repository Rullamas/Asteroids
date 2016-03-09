module Bullets (Bullet, initBullet, updateBullets) where

import Graphics.UI.GLUT
import Data.IORef
import Display
import Types

bulletSpeed :: Float
bulletSpeed = 10.0

bulletLine :: Float
bulletSpeed = 10.0

-- Trying to create the actual bullet
bulletLine :: LineSegment
bulletLine = LineSegment ((0, -bulletSpeed/2.0),(0,bulletSpeed))

-- Time bullet stays on screen/travels
bulletTime :: Int
bulletTime = 50

data Bullet = Bullet
   { bulletLife :: Int
   , bulletBody :: Body
   }
   
-- need to still initialize