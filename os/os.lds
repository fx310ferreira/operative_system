ENTRY(_start);

SECTIONS
{
  . = 0x11000;

  .text BLOCK(4K) : ALIGN(4K) 
  {
    *(.text)
    *(.multiboot)
  }

	.data :
	{
		*(.data)
	}

	.bss :
	{
		*(.bss)
	}
}
 