OS := $(shell uname -s)

demo: build
ifeq ($(OS), Linux)
	$(CC) src/demo.c -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/demo
endif
ifeq ($(OS), Darwin)
	$(CC) src/demo.c `pkg-config --libs --cflags raylib` -o build/demo 
endif

build:
	mkdir -p build

.PHONY: clean
clean:
	rm -rf build/*
