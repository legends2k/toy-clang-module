# https://riptutorial.com/swift/example/1418
# https://nullprogram.com/blog/2017/08/20/

.POSIX:
CC     = cc
CFLAGS = -std=c11 -Wall -Werror -pedantic -pedantic-errors

hello: hello.swift MyCMod/adder.o
	swiftc -I . -o $@ MyCMod/adder.o hello.swift
# look for modules in current directory

MyCMod/adder.o: MyCMod/adder.c MyCMod/adder.h

clean:
	rm -f hello MyCMod/adder.o
