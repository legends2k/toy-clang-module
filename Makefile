.POSIX:

CC     = cc
CFLAGS = -std=c11 -Wall -Werror -pedantic -pedantic-errors

hello: hello.swift MyCMod/adder.o
	swiftc -I . -o $@ MyCMod/adder.o hello.swift
# look for modules in current directory

MyCMod/adder.o: MyCMod/adder.c MyCMod/adder.h

clean:
	rm -f hello MyCMod/adder.o
