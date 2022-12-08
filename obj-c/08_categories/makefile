CC := clang

.PHONY = clean all
PROGS = test

HEADERS = calc.h calc+math.h unnecessary.h
SOURCES = main.m calc.m calc+math.m unnecessary.m
OBJECTS=$(SOURCES:.m=.o)

all: $(PROGS)

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

${PROGS}: ${OBJECTS}
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

endif

ifeq ($(UNAME), Darwin)

${PROGS}: ${OBJECTS}
	$(CC) -fobjc-arc ${SOURCES} -o ${PROGS}

endif

clean: 
	rm $(PROGS) *.o *.d
