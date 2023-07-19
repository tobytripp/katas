CC=gcc

SOURCES=src/bowling.c
TESTS=test/bowling_test.c
LIBS=lib/munit/munit.c

CFLAGS=-Wall -I. -Ilib

OBJECTS=$(SOURCES:%.c=%.o)
TEST_OBJECTS=$(TESTS:%.c=%.o)
LIB_OBJECTS=$(LIBS:%.c=%.o)
DEPS=src/bowling.h

default: test

test: test_main
	./test_main

test_main: $(OBJECTS) $(TEST_OBJECTS) $(LIB_OBJECTS)
	$(CC) $(OBJECTS) $(TEST_OBJECTS) $(LIB_OBJECTS) -o test_main

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	-rm -f test_main
	-rm -f $(OBJECTS) $(TEST_OBJECTS) $(LIB_OBJECTS)

