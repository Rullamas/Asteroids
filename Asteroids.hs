import Graphics.UI.GLUT
import Data.IORef
import Bindings

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  initialWindowSize $= Size 700 700
  _window <- createWindow "Asteroids"
  reshapeCallback $= Just reshape
  keyboardMouseCallback $= Just keyboardMouse
  displayCallback $= display
  mainLoop