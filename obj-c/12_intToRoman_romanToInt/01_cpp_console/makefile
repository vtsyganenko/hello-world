
CC = g++
CFLAGS = -c -std=c++11 -Wall -Wextra -Werror

all: clean test

test: main.o int_roman_converter.o
	$(CC) main.o int_roman_converter.o -o test

main.o: 
	$(CC) $(CFLAGS) main.cc 

int_roman_converter.o: 
	$(CC) $(CFLAGS) int_roman_converter.cc

clean:
	rm -rf *.o test
