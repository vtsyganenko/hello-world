TARGET=operators_example
CC=g++
CFLAGS=-std=c++11 -Wall -Wextra -Werror

all: $(TARGET)

$(TARGET): fraction.o main.o
	$(CC) fraction.o main.o -o $(TARGET)

main.o: main.cc
	$(CC) -c $(CFLAGS) main.cc

fraction.o: fraction.cc
	$(CC) -c $(CFLAGS) fraction.cc

clean:
	rm -rf *.o $(TARGET)
