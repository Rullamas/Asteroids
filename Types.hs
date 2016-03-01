module Types where

import Graphics.UI.GLUT
import Data.IORef

type IOGLf = IORef GLfloat
type IOGLfPair = IORef (GLfloat, GLfloat)