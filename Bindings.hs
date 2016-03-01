module Bindings (idle, display, reshape, keyboardMouse) where
 
import Graphics.UI.GLUT
import Data.IORef
import Display
import Types
 
reshape :: ReshapeCallback
reshape size = do 
  viewport $= (Position 0 0, size)
 
keyboardMouse :: IOGLfPair -> IOGLf -> KeyboardMouseCallback
keyboardMouse delta shipAngle _key _state _modifiers _position = case _key of
   (Char 'w') -> delta $~! \(x,y) -> (x,y+0.001)
   --(Char 's') -> delta $~! \(x,y) -> (x,y-0.001)
   (Char 'a') -> shipAngle $~! \x -> (x + 0.001)
   (Char 'd') -> shipAngle $~! \x -> x - 0.001
   (SpecialKey KeyUp   ) -> delta $~! \(x,y) -> (x,y+0.001)
   --(SpecialKey KeyDown ) -> delta $~! \(x,y) -> (x,y-0.001)
   (SpecialKey KeyLeft ) -> shipAngle $~! \x -> (x + 0.001)
   (SpecialKey KeyRight) -> shipAngle $~! \x -> x - 0.001
   _ -> return ()

idle :: IOGLfPair -> IOGLfPair -> IOGLf -> IOGLf -> IdleCallback
idle pos delta shipAngle shipAngleDelta= do
   (dx, dy) <- get delta
   pos $~! \(x, y) -> (x + dx, y + dy)
   sad <- get shipAngleDelta
   shipAngle $~! (+ sad)
   postRedisplay Nothing
