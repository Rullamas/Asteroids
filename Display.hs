module Display (display) where
 
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Designs

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]
 
display ::IORef GLfloat -> IORef (GLfloat, GLfloat) -> DisplayCallback
display rotate pos = do 
  clear [ColorBuffer]
  a <- get rotate
  b <- get pos
  ship a b
  flush
  swapBuffers -- Refreshes screen, necessary when double buffered.
