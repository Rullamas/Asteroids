module Asteroids.Callbacks
    ( initCallbackRefs
    , renderViewport
    , handleKeyboard
    ) where

import Data.IORef
import Data.Time.Clock.POSIX
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
-- Other initialization imports go here, like rendering and keyboard

type KeyboardRef = IORef Keyboard
type TimeRef     = IORef POSIXTime
type StateRef    = IORef GameState
type AccumRef    = TimeRef
type PrevTimeRef = TimeRef

type CallbackRefs = (AccumRef, PrevTimeRef, KeyboardRef, StateRef)

secPerFrame :: fractional a => a
-- 30 frames a second
secPerFrame = 0.0333

maxFrameTime :: Fractional a => a
maxFrameTime = 0.1

initCallbackRefs :: IO CallbackRefs
initCallbackRefs = do
    accum <- newIORef secPerFrame
    prev  <- getPOSIXTime >>= newIORef
    keyb  <- newIORef initKeyboard
    return (accum, prev, keyb)
    
renderViewPort :: CallbackRefs -> IO ()
renderViewport (ar, pr, kb, sr) = do
    current <- getPOSIXTime
    accum <- readIORef ar
    prev  <- readIORef pr
    keys  <- readIORef kb
    
    let consumeAccum acc s
            | acc >= secPerFrame =
                consumeAccum (acc - secPerFrame) $ tickState keys s
            | otherwise = (acc, s)
        frameTime = min (current - prev) maxFrameTime
    
    (accum', s') <- fmap (consumeAccum (accum + frameTime)) $ readIORef sr
    
    writeIORef sr s'
    writeIORef ar accum'
    writeIORef pr current
    
    clear [ColorBuffer]
    
    let interpolation = realToFrac $ accum' / secPerFrame
    renderInterpolated interpolation s'
    swapBuffers
    postRedisplay Nothing
    
-- Also needs to handle keyboard