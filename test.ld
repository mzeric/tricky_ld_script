MEMORY {
		RAM (rx)    :  ORIGIN = 0x00000000, LENGTH = 128M
		SRAM (rwx)  :  ORIGIN = 0x40000000, LENGTH = 32k
}
SECTIONS {
		/* Other sections go here. */
		.text : {
				*(.text*)
		} >RAM AT>RAM
		.data : {
				*(.data*)
		} >RAM AT>RAM

		.sram : {
		_start_sram_funcs = ABSOLUTE(.);
				*(.sram*)
		_end_sram_funcs = ABSOLUTE(.);
		} >SRAM AT>RAM

		_load_sram_funcs = LOADADDR(.sram);

		.bss : {
		} >RAM

		.stack : {
		} >RAM
}
