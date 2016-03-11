-- Asteroids
-- Team: Brandon Rullamas, Christina Duran, Joshua Wallace
-- CMPS 112 Final Project Springs 2016

module Main where
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Callbacks

main = play
       (InWindow 
           "Asteroids" 
           (800,800) 
           (0,0))
       black
       60
       initialWorldCallback
       drawPictureCallback
       keyboardMouseCallback
       stepWorldCallback
