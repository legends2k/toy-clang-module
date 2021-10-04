.POSIX:

# Don’t set CC/CXX; do it in the make command e.g. make CC=g++
COMPILER_FLAGS = -Wall -Werror -pedantic -pedantic-errors
CFLAGS         = -std=c11 $(COMPILER_FLAGS)
CXXFLAGS       = -std=c++17 $(COMPILER_FLAGS)

hello: hello.swift MyCMod/adder.o
	swiftc -I . -o $@ MyCMod/adder.o hello.swift
# Look for modules in current directory.

MyCMod/adder.o: MyCMod/adder.cpp MyCMod/adder.h

clean:
	$(RM) hello MyCMod/adder.o

# Golden rule of Makefile: every target should update the file naming it.
# Add Golden rule’s exceptions to .PHONY.
.PHONY: clean
