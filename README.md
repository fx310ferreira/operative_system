# Operative System (Change the name when I invent one)

## Description
(to be written)

### Todos
1. [Bootloader](./bootloader/)
   - [x] Set up all the segments
      - [x] set up Stack Segment (SS)
      - [x] set up Extra Segment (ES)
      - [x] set up Data Segment (DS)
   - [x] Basic print
   - [ ] Read and load the Kernel
      - [x] Where in memory should I load it, does it matter? Yes, 0x010000, move this address into ES
      - [x] Where can I find the Kernel?
      - [ ] Change to 32 bit protected mode
2. Kernel

- [ ] Write the description
- [x] Really understand segments understand org 0x07C00 vs mov ax, 0x07C0, mov ds, ax
- [x] Rework makefiles
- [ ] Obsidian stuff
- [ ] GCC Cross Compiler missing
- [ ] understand gdb behavior on int calls