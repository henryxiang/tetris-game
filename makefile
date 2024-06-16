OS := $(shell uname -s)
VPATH := src
EXE := $(shell find $(VPATH) -name '*.c' -exec basename {} .c \;)


.PHONY: all
all: $(EXE)

$(EXE): %: %.c | build
ifeq ($(OS), Linux)
	$(CXX) $< -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/$@
endif
ifeq ($(OS), Darwin)
	$(CXX) $< `pkg-config --libs --cflags raylib` -o build/$@
endif

build:
	mkdir -p build

.PHONY: clean
clean:
	rm -rf build/*
