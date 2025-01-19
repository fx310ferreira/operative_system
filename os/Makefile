BUILD_DIR=../build/os
OS=$(BUILD_DIR)/os

CFLAGS=-Wall -Wno-format
CFLAGS+=-fno-stack-protector -fno-omit-frame-pointer -fno-asynchronous-unwind-tables
CFLAGS+=-fno-builtin -masm=intel -m32 -nostdlib -gdwarf-2 -ggdb3 -save-temps -fno-pic -fno-pie

OS_SRCS := $(wildcard *.c)
OS_OBJS := $(patsubst %.c, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS)

$(BUILD_DIR)/%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

$(OS): $(OS_OBJS)
	ld --trace -m elf_i386 -T os.lds $(OS_OBJS) -o $@
	objcopy --only-keep-debug $(OS) $(OS).dbg
	objcopy --strip-debug $(OS)
	objcopy --add-gnu-debuglink=$(OS).dbg $(OS)

clean:
	rm $(BUILD_DIR)/*
