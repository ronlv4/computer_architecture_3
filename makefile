all: clean main

main: obj/main.o
	gcc -m32 -Wall -g obj/main.o -o bin/main

obj/main.o: src/main.s
	nasm -f elf src/main.s -o obj/main.o

clean:
	rm -rf bin/* obj/* list/*
