.POSIX:

CC             = g++
COMPILER_FLAGS = -Wall -Werror -pedantic -pedantic-errors
CFLAGS         = -std=c11 ${COMPILER_FLAGS}
CXXFLAGS       = -std=c++17 ${COMPILER_FLAGS}

hello: hello.swift MyCMod/adder.o
	swiftc -I . -o $@ MyCMod/adder.o hello.swift
# look for modules in current directory

MyCMod/adder.o: MyCMod/adder.cpp MyCMod/adder.h

clean:
	rm -f hello MyCMod/adder.o
