#!/bin/bash

OS=$(uname -s)

if [ "$OS" = "Linux" ]; then
    g++ $* -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/app
fi

if [ "$OS" = "Darwin" ]; then
    c++ $* $(pkg-config --libs --cflags) -std=c++11 -o build/app
fi
