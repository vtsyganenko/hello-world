CC := clang

.PHONY = clean all
PROGS = polymorph

SOURCES = objects.m main.m
OBJECTS=$(SOURCES:.m=.o)

all: $(PROGS)

UNAME := $(shell uname)

# for Linux
ifeq ($(UNAME), Linux)
	
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

${PROGS}: ${OBJECTS}
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

endif

# for MacOS
ifeq ($(UNAME), Darwin)

${PROGS}: ${OBJECTS}
	$(CC) -fobjc-arc ${SOURCES} -o ${PROGS}

endif

clean: 
	rm $(PROGS) *.o *.d

