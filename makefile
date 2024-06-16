OS := $(shell uname -s)
DEMO_SRC := src/demo.cpp src/ball.cpp

demo: build
ifeq ($(OS), Linux)
	$(CXX) $(DEMO_SRC) -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/demo
endif
ifeq ($(OS), Darwin)
	$(CXX) $(DEMO_SRC) `pkg-config --libs --cflags raylib` -std=c++11 -o build/demo
endif

build:
	mkdir -p build

.PHONY: clean
clean:
	rm -rf build/*
