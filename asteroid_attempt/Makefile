#Id: Makefile,v 1.2 2016-01-19 17:49:34-08 - - $
OS = $(shell uname)
GPP  = g++ -std=gnu++14
FLAGS = -g -O0 -Wall -Wextra

#LIBS = -lGLU -lX11 -lrt -lm
ifeq ($(OS),Linux)
	FLAGS += -lGL -lglut -lGLU
endif
ifeq ($(OS),Darwin)
	FLAGS += -framework glut -framework OpenGL
endif
ifeq ($(OS),Cygwin)
	FLAGS += -lopengl32 -lglut32
endif

all : asteroids

asteroids : asteroids.cpp
	${GPP} ${FLAGS} asteroids.cpp -o asteroids

ci : Makefile asteroids.cpp
	cpplint.py.perl asteroids.cpp
	cid Makefile asteroids.cpp

test : all
	asteroids &

clean :
	rm asteroids

