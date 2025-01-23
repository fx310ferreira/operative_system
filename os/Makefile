BUILD_DIR=../build/os
OS=$(BUILD_DIR)/os

CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra -ggdb3

OS_SRCS := $(wildcard *.c)
OS_OBJS := $(patsubst %.c, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS)

$(BUILD_DIR)/%.o: %.c
	i686-elf-gcc $(CFLAGS) -c $< -o $@

$(OS): $(OS_OBJS)
	i686-elf-ld --trace -m elf_i386 -T os.lds $(OS_OBJS) -o $@
	objcopy --only-keep-debug $(OS) $(OS).dbg
	objcopy --strip-debug $(OS)
	objcopy --add-gnu-debuglink=$(OS).dbg $(OS)

clean:
	rm $(BUILD_DIR)/*
