-- Asteroids
-- Team: Brandon Rullamas, Christina Duran, Joshua Wallace
-- CMPS 112 Final Project Springs 2016

module Types where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Interface.Pure.Simulate
import Graphics.Gloss.Interface.Pure.Display
import Graphics.Gloss.Data.Picture

-- Types aliases to make code more clear
type Location = (Float, Float)
type Speed = (Float, Float)
type Size = Float
type Life = Float
type Asteroids = [Asteroid]
type Bullets = [Bullet]
type Pictures = [Picture]
type Outline = [Point]

-- Data type to define the objects in the game
data Game = Continue Ship Bullets Asteroids | End deriving (Eq, Show)

-- Object types
data Ship = Ship Location Speed Outline deriving (Eq, Show)
data Asteroid = Asteroid Location Speed Size deriving (Eq, Show)
data Bullet = Bullet Location Speed Life deriving (Eq, Show)