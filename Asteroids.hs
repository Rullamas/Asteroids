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
  pos <- newIORef (0,0.05)
  delta <- newIORef (0,0)
  shipAngle <- newIORef 0.0
  shipAngleDelta <- newIORef 0.0
  keyboardMouseCallback $= Just (keyboardMouse delta shipAngleDelta)
  idleCallback $= Just (idle pos delta shipAngle shipAngleDelta)
  displayCallback $= display pos shipAngle
  mainLoop
