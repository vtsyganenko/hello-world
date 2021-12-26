CC := clang
GNUSTEP_LIBS = $(shell gnustep-config --base-libs)
GNUSTEP_FLAGS = $(shell gnustep-config --objc-flags)

.PHONY = clean all

PROGS = file_manager

all: $(PROGS)

%.o: %.m
	$(CC) $(GNUSTEP_FLAGS) -c $^

$(PROGS): main.o
	$(CC) -o $@ $^ $(GNUSTEP_LIBS)

clean: 
	rm $(PROGS) *.o
