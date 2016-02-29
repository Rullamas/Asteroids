type Hitpoints = Int
data Asteroid = Asteroid
   { asteroidSize  :: Size
   , asteroidBody  :: Body
   , asteroidHits  :: Hitpoints
   , asteroidLines :: [LineSegment]
   }

type RandomAsteroid = Random Asteroid

radius :: Size -> Float
radius Small = 14
radius Medium = 32
radius Large = 60

maxHits :: Size -> Int
maxHits Small = 3
maxhits Medium = 6
maxHits Large = 9

-- taken from http://www.classicgaming.cc/classics/asteroids/wallpaper/ast_scrshot_1024x768.gif
totVertices :: Size -> Int
totVertices Small = 13
totVertices Medium = 13
totVertices Large = 13

-- OpenGL Vec2 usage
newAsteroid :: Size -> Vec2 -> Vec2 -> Float -> [LineSegment] -> Asteroid
newAsteroid size pos vec rad = Asteroid size (initBody pos 0 vec rad) (maxHits size)

updateAsteroid :: Asteroid -> Asteroid
updateAsteroid a = a { asteroidBody = updateBody $ asteroidBody a }

damageAsteroid :: Asteroid -> Asteroid
damageAsteroid a = a { asteroidHits = asteroidHits a - 1}

statusAsteroid :: Asteroid -> Bool
statusAsteroid == (0<).asteroidHits

-- Collide function to be added