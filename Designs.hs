module Designs where

import Graphics.UI.GLUT
import Types

vertex3f :: (GLfloat, GLfloat, GLfloat) -> IO ()
vertex3f (x, y, z) = vertex $ Vertex3 x y z

scaledVertex3f :: GLfloat -> (GLfloat, GLfloat, GLfloat) -> IO ()
scaledVertex3f size (x, y, z) = vertex3f (x * size, y * size, z * size)

xPos :: GLfloat
xPos = 0

yPos :: GLfloat
yPos = 0.05

ship :: (GLfloat, GLfloat) -> IO ()
ship (x,y) = renderPrimitive Polygon $ do
  vertex3f (x, y, 0)
  vertex3f (x + 0.04,y-0.1, 0)
  vertex3f (x,y-0.075, 0)
  vertex3f (x-0.04,y-0.1, 0)

--Takes a scaling factor and a list of 3 dimensional points and creates a line shape.
rock :: GLfloat -> [(GLfloat, GLfloat, GLfloat)] -> IO ()
rock size pointList = renderPrimitive LineLoop $ mapM_ (scaledVertex3f size) pointList

--Design #1 for the asteroids
rockOne :: [(GLfloat, GLfloat, GLfloat)]
rockOne = [(0.025, 0.05, 0), (0.05, 0.02, 0), (0.05, -0.04, 0), (0.035, -0.05, 0),
           (0.015, -0.04, 0), (-0.03, -0.06, 0), (-0.02, -0.015, 0), (-0.04, 0.015, 0),
           (-0.03, 0.04, 0), (-0.03, 0.025, 0), (-0.015, 0.05, 0)]
       
--Design #2 for the asteroids    
rockTwo :: [(GLfloat, GLfloat, GLfloat)]
rockTwo = [(0.025, 0.05, 0), (0.06, 0.035, 0), (0.025, 0, 0), (0.055, -0.04, 0),
           (0.045, -0.06, 0), (-0.035, -0.07, 0), (-0.05, -0.025, 0), (-0.04, 0.025, 0),
           (-0.02, 0.035, 0), (-0.015, 0.005, 0)]