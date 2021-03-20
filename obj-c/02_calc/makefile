CC := clang
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

.PHONY = clean all
PROGS = calc

HEADERS = calc.h
SOURCES = calc.m main.m

all: $(PROGS)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

calc: calc.o main.o
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

clean: 
	rm $(PROGS) *.o *.d
