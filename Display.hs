module Display (display) where
 
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Designs
import Types
 
display ::IOGLfPair -> IOGLf -> DisplayCallback
display pos shipAngle = do 
  clear [ColorBuffer]
  loadIdentity
  a <- get pos
  angle <- get shipAngle
  rotate angle $ Vector3 0 0 1
  preservingMatrix $ do
    ship a
    --rock 2 rockTwo
  flush
  swapBuffers -- Refreshes screen, necessary when double buffered.
