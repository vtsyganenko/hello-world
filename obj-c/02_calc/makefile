# intended for Linux / MacOS
UNAME := $(shell uname)

CC := clang
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

# commands not connected with particular files
.PHONY = clean all

PROGS = calc

# target: prerequisites
# -tab- command
# $^ outputs prerequisites
# $@ outputs target

all: $(PROGS)

# for Linux
ifeq ($(UNAME), Linux)
%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

calc: calc.o main.o
	@echo System is $(UNAME)
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)
endif

# for MacOS
ifeq ($(UNAME), Darwin)
calc: calc.o main.o
	@echo System is $(UNAME)
	$(CC) -fobjc-arc calc.m main.m -o $@
endif

clean: 
	rm $(PROGS) *.o *.d
