module Display (display) where
 
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Designs
import Types
 
outFrame:: (GLfloat, GLfloat) -> (GLfloat, GLfloat)
outFrame (x, y) 
             | y < 0.9 && y > -0.9 = (x,y)
             | y > 0.9 = (0, 0)
             | y < -0.9 = (0, 0)
             | otherwise = (x, y)
                  

display ::IOGLfPair -> IOGLf -> DisplayCallback
display pos shipAngle = do 
  clear [ColorBuffer]
  loadIdentity
  a <- get pos
--  print a
  let b = outFrame a
--  print b
  angle <- get shipAngle
  rotate angle $ Vector3 0 0 1
  preservingMatrix $ do
     ship a
  --   ship b
  --   rock 2 rockTwo
  flush
  swapBuffers -- Refreshes screen, necessary when double buffered.
