Q = @
#INCLUDE_PREF = -I

CC := g++ 

#Here the source files are specified

#list_src_files = $(shell find . -type f -name "*.m")
#SRCS := $(subst ./,,$(call list_src_files))
#SRCS := main.m int_roman_converter_wrapper.mm ../../01_cpp_console/int_roman_converter.cc

#Here is our include files

#list_include_dirs = $(shell find . -type d -name "include")
#list_include_dirs = ../../01_cpp_console/
#INCLUDE_LS := $(call list_include_dirs)
#INCLUDE_DIRS := $(INCLUDE_PREF).
#INCLUDE_DIRS += $(addprefix $(INCLUDE_PREF), $(subst ./,,$(INCLUDE_LS)))

INCLUDE_DIRS := -I ../../01_cpp_console

#Flags used with gcc

#CFLAGS = -Wall -fobjc-arc -framework Foundation -g -O0 $(INCLUDE_DIRS)
CFLAGS = -Wall -fobjc-arc -g -O0 $(INCLUDE_DIRS)

CFLAGS1 = -c -std=c++11 -Wall -Wextra -Werror

#Here all object files are specified

#OBJS := $(SRCS:%.m=%.o)
OBJS := main.o int_roman_converter_wrapper.o int_roman_converter.o

#Here is the name of target specified

TARGET := test

#Here is our target

$(TARGET): $(OBJS)
	$(Q)$(CC) $(CFLAGS) $^ -o $@

%.o: %.m 
	$(Q)$(CC) $(CFLAGS) -c $< -o $@

%.o: %.mm 
	$(Q)$(CC) $(CFLAGS) -c $< -o $@

#%.o: %.cc
#	$(Q)$(CC) $(CFLAGS1) -c $< -o $@

int_roman_converter.o: 
	$(CC) $(CFLAGS1) ../../01_cpp_console/int_roman_converter.cc

.PHONY: clean

clean:
	$(Q)-rm $(OBJS) $(TARGET) 2>/dev/null || true
