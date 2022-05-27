CC := clang
.PHONY = clean all

SOURCES = list.m MyClass.m main.m
OBJECTS=$(SOURCES:.m=.o)
TARGET = test

all: $(TARGET)

# intended for Linux / MacOS
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

${TARGET}: ${OBJECTS}
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)
endif

ifeq ($(UNAME), Darwin)
${TARGET}: ${OBJECTS}
	$(CC) -fobjc-arc ${SOURCES} -o ${TARGET}
endif

clean: 
	rm $(TARGET) *.o *.d
