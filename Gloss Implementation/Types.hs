-- Asteroids
-- Team: Brandon Rullamas, Christina Duran, Joshua Wallace
-- CMPS 112 Final Project Springs 2016

module Types where

-- Types aliases to make code more clear
type Point = (Float, Float)
type Speed = Float
type Size = Float
type Life = Float
type Rocks = [Rock]
type Bullets = [Bullet]

-- Data type to define the objects in the game
data Game = Continue Ship Bullets Rocks | End deriving (Eq, Show)

-- Object types
data Ship = Ship Point Speed deriving (Eq, Show)
data Rock = Rock Point Speed Size deriving (Eq, Show)
data Bullet = Bullet Point Speed Life deriving (Eq, Show)