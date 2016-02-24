module Designs where

import Graphics.UI.GLUT

vertex3f :: (GLfloat, GLfloat, GLfloat) -> IO ()
vertex3f (x, y, z) = vertex $ Vertex3 x y z

xPos :: GLfloat
xPos = 0

yPos :: GLfloat
yPos = 0.05

ship :: GLfloat -> (GLfloat, GLfloat) -> IO ()
ship rotate (x,y) = renderPrimitive Polygon $ do
  vertex3f (x, y, 0)
  vertex3f (x + 0.04,y-0.1, 0)
  vertex3f (x,y-0.075, 0)
  vertex3f (x-0.04,y-0.1, 0)
  
rockOne :: IO ()
rockOne = renderPrimitive LineLoop $ do
  vertex3f (0.025, 0.05, 0)
  vertex3f (0.05, 0.02, 0)
  vertex3f (0.05, -0.04, 0)
  vertex3f (0.035, -0.05, 0)
  vertex3f (0.015, -0.04, 0)
  vertex3f (-0.03, -0.06, 0)
  vertex3f (-0.02, -0.015, 0)
  vertex3f (-0.04, 0.015, 0)
  vertex3f (-0.03, 0.04, 0)
  vertex3f (-0.03, 0.025, 0)
  vertex3f (-0.015, 0.05, 0)
