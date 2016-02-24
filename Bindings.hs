module Bindings (idle, display, reshape, keyboardMouse) where
 
import Graphics.UI.GLUT
import Data.IORef
import Display
 
reshape :: ReshapeCallback
reshape size = do 
  viewport $= (Position 0 0, size)
 
keyboardMouse :: IORef GLfloat -> IORef (GLfloat,GLfloat) -> KeyboardMouseCallback
keyboardMouse a b _key _state _modifiers _position = case _key of
   (Char 'w') -> b $~! \(x,y) -> (x,y+0.01)
   (Char 's') -> b $~! \(x,y) -> (x,y-0.01)
   _ -> return ()

idle :: IORef GLfloat -> IORef GLfloat -> IdleCallback
idle angle change = do
   d <- get change
   angle $~! (+ d)
   postRedisplay Nothing
