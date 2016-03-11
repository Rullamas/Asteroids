-- Asteroids
-- Team: Brandon Rullamas, Christina Duran, Joshua Wallace
-- CMPS 112 Final Project Springs 2016

module Designs where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Graphics.Gloss.Data.Picture
import Types

--Design #1 for the asteroids
--rockOne :: [(GLfloat, GLfloat, GLfloat)]
--rockOne = [(0.025, 0.05, 0), (0.05, 0.02, 0), (0.05, -0.04, 0), (0.035, -0.05, 0),
--           (0.015, -0.04, 0), (-0.03, -0.06, 0), (-0.02, -0.015, 0), (-0.04, 0.015, 0),
--           (-0.03, 0.04, 0), (-0.03, 0.025, 0), (-0.015, 0.05, 0)]
       
--Design #2 for the asteroids    
--rockTwo :: [(GLfloat, GLfloat, GLfloat)]
--rockTwo = [(0.025, 0.05, 0), (0.06, 0.035, 0), (0.025, 0, 0), (0.055, -0.04, 0),
--           (0.045, -0.06, 0), (-0.035, -0.07, 0), (-0.05, -0.025, 0), (-0.04, 0.025, 0),
--           (-0.02, 0.035, 0), (-0.015, 0.005, 0)]


-- To start the game off with.
initialShip :: Ship
initialShip = Ship (0,0) (0,0) [(0, 20),
                                    (12, - 20),
                                    (10, -15),
                                    (-10, -15),
                                    (-12, -20)]

-- To start the game off with.
<<<<<<< HEAD
initialAsteroidList :: Asteroids
initialAsteroidList = [Asteroid (200,200) (-10, -8) 30,
                       Asteroid (-150,200) (13, 5) 40]
=======
initialRockList :: Asteroids
initialRockList = [Asteroid (200,200) (-10, -8) 30,
                  Asteroid (-150,200) (13, 5) 40]
                 -- Asteroid (40,20) (-2, 8) 20,
                 -- Asteroid (400,600) (5, -6) 30,
                 -- Asteroid (550,150) (2, -10) 40
>>>>>>> origin/master

-- For the drawPictureCallback to translate the ship into a picture.
convertShip :: Ship -> Picture
convertShip (Ship _ _ outline) =
    color white (lineLoop outline)


-- For the drawPictureCallback to translate a list of asteroids into pictures.
convertAsteroids :: Asteroids -> Pictures
convertAsteroids [] = []
convertAsteroids (x:y:xs) =
    (color white (lineLoop (asteroidStyle1 x))):(color white (lineLoop (asteroidStyle2 y))):convertAsteroids xs

-- Style of asteroid
asteroidStyle1 :: Asteroid -> Path
asteroidStyle1 (Asteroid (x, y) _ size) = [(x+0.5*size, y+1.0*size),
                                           (x+1.0*size, y+0.4*size),
                                           (x+1.0*size, y-0.8*size),
                                           (x+0.7*size, y-1.0*size),
                                           (x+0.3*size, y-0.8*size),
                                           (x-0.6*size, y-1.2*size),
                                           (x-0.4*size, y-0.3*size),
                                           (x-0.8*size, y+0.3*size),
                                           (x-0.6*size, y+0.8*size),
                                           (x-0.5*size, y+0.5*size),
                                           (x-0.3*size, y+1.0*size)]

-- Style of asteroid
asteroidStyle2 :: Asteroid -> Path
asteroidStyle2 (Asteroid (x, y) _ size) = [(x+0.5*size, y+1.0*size),
                                           (x+1.2*size, y+0.7*size),
                                           (x+0.5*size, y+0.0*size),
                                           (x+1.3*size, y-0.8*size),
                                           (x+0.9*size, y-1.2*size),
                                           (x+0.7*size, y-0.9*size),
                                           (x-0.7*size, y-1.4*size),
                                           (x-1.0*size, y-0.5*size),
                                           (x-0.8*size, y+0.5*size),
                                           (x-0.4*size, y+0.7*size),
                                           (x-0.3*size, y+0.1*size)]

-- For the drawPictureCallback to translate a list of bullets into pictures.
convertBullets :: Bullets -> Pictures
convertBullets [] = []
convertBullets ((Bullet (ax, ay) _ _):xs) =
    (translate ax ay (color white (circle 2))):convertBullets xs
