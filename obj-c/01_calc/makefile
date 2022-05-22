# intended for Linux / MacOS
UNAME := $(shell uname)

CC := clang
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

# commands not connected with particular files
.PHONY = clean all

TARGET = calc

# target: prerequisites
# -tab- command
# $^ outputs prerequisites
# $@ outputs target

all: $(TARGET)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

ifeq ($(UNAME), Linux)
calc: main.o
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)
endif

ifeq ($(UNAME), Darwin)
calc:
	@echo "System is "$(UNAME)
	$(CC) -fobjc-arc main.m -o $@
endif

clean: 
	rm $(TARGET) *.o *.d
