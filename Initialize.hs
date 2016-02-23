module Asteroids.Initialize where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

initializeWindow = do
    _ <- getArgsandInitialize
    initialWindowSize $= Size 800 600
    initialDisplayMode $= [DoubleBuffered]
    createWindow "Asteroids"

initializeOpenGL = do
    depthMask $= Disabled
    
    lineSmooth $= Enabled
    blend      $= Enabled
    blendFunc  $= (SrcAlpha,OneMinusSrcAlpha)
    lineWidth  $= 2.0

    viewport $= (Position 0 0, Size 800 600)

    matrixMode $= Projection
    loadIdentity
    ortho 0 800 600 0 (-1) 1
    matrixMode $= Modelview 0
    loadIdentity

    clearColor $= Color4 0.0 0.0 0.1 1.0

initializeCallbacks = do
    refs <- initCallbackRefs
    keyboardMouseCallback $= Just (handleKeyboard refs)
    displayCallback $= renderViewprot refs