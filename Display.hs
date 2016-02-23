module Display (display) where
 
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Designs

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]
 
display :: DisplayCallback
display = do 
  clear [ColorBuffer]
  ship
  flush
  swapBuffers -- Refreshes screen, necessary when double buffered. 