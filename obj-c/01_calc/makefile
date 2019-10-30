CC := clang
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

.PHONY = clean all
PROGS = hello

HEADERS = myclass.h
SOURCES = myclass.m main.m

all: $(PROGS)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

hello: main.o
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

clean: 
	rm $(PROGS) *.o
