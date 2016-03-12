-- Asteroids
-- Team: Brandon Rullamas, Christina Duran, Joshua Wallace
-- CMPS 112 Final Project Springs 2016

module Callbacks where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Types
import Designs
import Functions

-- This is the initial state of the game when it is first loaded.
-- The ship is in the middle with zero speed, it has not shot any bullets, and the initial
-- set of asteroids is placed on screen.
initialWorldCallback :: Game
initialWorldCallback = Continue initialShip [] initialAsteroidList

-- Each time the game refreshes, it draws based on this callback.
-- The current values of the game are used in determining what to draw.
drawPictureCallback :: Game -> Picture
drawPictureCallback (Continue ship bullets asteroids)
    = pictures [drawShip, drawBullets, drawAsteroids]
    where
        drawShip = shipToPicture ship
        drawAsteroids = pictures $ convertAsteroids asteroids
        drawBullets = pictures $ convertBullets bullets

-- This callback is fired each time there is an event such as a keyboard or mouse press.
keyboardMouseCallback :: Event -> Game -> Game
keyboardMouseCallback (EventKey (Char 'w') Down _ _) (Continue ship b a) =
    Continue (thrustShip 5 ship) b a

keyboardMouseCallback (EventKey (Char 'w') Up _ _) (Continue ship b a) =
    Continue (thrustShip 0 ship) b a

keyboardMouseCallback (EventKey (Char 'a') Down _ _) (Continue ship b a) =
    Continue (rotateShip (0.3) ship) b a

keyboardMouseCallback (EventKey (Char 'a') Up _ _) (Continue ship b a) =
    Continue (rotateShip (0) ship) b a

keyboardMouseCallback (EventKey (Char 'd') Down _ _) (Continue ship b a) =
    Continue (rotateShip (-0.3) ship) b a

keyboardMouseCallback (EventKey (Char 'd') Up _ _) (Continue ship b a) =
    Continue (rotateShip (0) ship) b a

-- keyboardMouseCallback (EventKey (Char ' ') Down _ _) (Continue ship b a) =
--    shootBullet 5 b
    
keyboardMouseCallback _ game = game
       
-- This callback is used in incrementing the game. It is similar to the IdleCallback in that
-- it's refreshing at a constant rate, performing the actions in the callback each time.
stepWorldCallback :: Float -> Game -> Game
-- stepWorldCallback interval (Continue ship b a) =
--     Continue (updateShip interval ship) b a


stepWorldCallback _ game = game
