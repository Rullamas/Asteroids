module Designs where

import Graphics.UI.GLUT

vertex3f :: (GLfloat, GLfloat, GLfloat) -> IO ()
vertex3f (x, y, z) = vertex $ Vertex3 x y z

ship :: IO ()
ship = renderPrimitive Polygon $ do
  vertex3f (0, 0.05, 0)
  vertex3f (0.04, -0.05, 0)
  vertex3f (0, -0.025, 0)
  vertex3f (-0.04, -0.05, 0)
  
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