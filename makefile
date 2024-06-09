demo:
	gcc src/demo.c -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o build/demo

clean:
	rm -rf build/*