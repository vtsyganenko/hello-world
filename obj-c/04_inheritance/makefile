UNAME := $(shell uname)
CC := clang

.PHONY = clean all

TARGET = test
SOURCES = based.m derived.m main.m
OBJECTS=$(SOURCES:.m=.o)

all: $(TARGET)

# for Linux
ifeq ($(UNAME), Linux)
	
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

${TARGET}: ${OBJECTS}
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

endif

# for MacOS
ifeq ($(UNAME), Darwin)

${TARGET}: ${OBJECTS}
	$(CC) -fobjc-arc ${SOURCES} -o ${TARGET}

endif

clean: 
	rm $(TARGET) *.o *.d
