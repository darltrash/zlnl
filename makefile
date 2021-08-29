CC=zig cc

generate:
	nelua -Mj "main.nelua" --output coutput/zlnl.c

build: generate
	$(CC) -I./coutput/ -I/usr/include/SDL2/ -O3 -lm -lSDL2 -pthread -ldl -fPIC -ftree-vectorize --std=c99 -ggdb coutput/*.c -o zlnl

run: build
	./zlnl