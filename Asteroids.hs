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
  rotate <- newIORef 0.0
  change <- newIORef 0.1
  pos <- newIORef (0,0.05)
  keyboardMouseCallback $= Just (keyboardMouse rotate pos)
  idleCallback $= Just (idle rotate change)
  displayCallback $= display rotate pos
  mainLoop
