.POSIX:

# Don’t set CC/CXX; do it in the make command e.g. make CC=g++
COMPILER_FLAGS = -Wall -Werror -pedantic -pedantic-errors
CFLAGS         = -std=c11 $(COMPILER_FLAGS)
CXXFLAGS       = -std=c++17 $(COMPILER_FLAGS)

# https://stackoverflow.com/q/1079832/183120
debug: CXXFLAGS += -g -O0 -D_DEBUG -DDEBUG
# default target
debug: hello
# No ‘all’ target since we’ve just one final artefact
# https://stackoverflow.com/a/2515000/183120

release: CXXFLAGS += -O2 -DNDEBUG
release: hello

hello: hello.swift MyCMod/adder.o
	swiftc -I . -o $@ MyCMod/adder.o hello.swift
# Look for modules in current directory.

MyCMod/adder.o: MyCMod/adder.cpp MyCMod/adder.h

# Recipe prefixes
# https://stackoverflow.com/q/3477292/183120
clean:
	@$(RM) hello MyCMod/adder.o

# Golden rule of Makefile: every target should update the file naming it.
# Add Golden rule’s exceptions to .PHONY.
.PHONY: clean
