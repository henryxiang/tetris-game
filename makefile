OS := $(shell uname -s)
VPATH := src
EXE := $(shell find $(VPATH) -name '*.cpp' -exec basename {} .cpp \;)

.PHONY: all
all: $(EXE)

$(EXE): %: %.cpp | build
ifeq ($(OS), Linux)
	$(CXX) $< -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/$@
endif
ifeq ($(OS), Darwin)
	$(CXX) $< `pkg-config --libs --cflags raylib` -std=c++11 -o build/$@
endif

build:
	mkdir -p build

.PHONY: clean
clean:
	rm -rf build/*
