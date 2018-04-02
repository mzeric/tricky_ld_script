
CROSS_PREFIX=arm-none-eabi-
CC=$(CROSS_PREFIX)gcc
LD=$(CROSS_PREFIX)ld
OBJCOPY=$(CROSS_PREFIX)objcopy
READELF=$(CROSS_PREFIX)readelf

all: test.elf
	$(OBJCOPY) -O binary -S -g test.elf test.bin
	$(READELF) -l $<

test.elf: test.c test.ld
	$(CC) $< -o $@ -nostartfiles -Ttest.ld

clean:
	$(RM) test.elf test.bin
