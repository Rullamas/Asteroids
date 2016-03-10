ASTEROIDS
*********
Brandon Rullamas, brullama
Christina Duran, crduran
Joshua Wallace, jotwalla

To compile: ghc Asteroids.hs
To run:
   1) Have GHC installed: see https://www.haskell.org/platform/. This should come with cabal, which is needed to install gloss, a package       used for creating the shapes.
   2) Open the terminal on your OS and run the following:
         cabal update
         cabal install gloss
      You can also install gloss with git:
         git clone https://github.com/benl23x5/gloss
         cd gloss/gloss
         cabal install
   3) Go to the Asteroids directory and run:
         ghc Asteroids.hs
   4) Run the executable
         Asteroids
