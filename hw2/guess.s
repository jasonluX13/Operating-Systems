#Jason Lu 
#Homework 2
.code16 # Use 16-bit assembly
.globl start # This tells the linker where we want to start executing

start:
movw $message, %si # load the offset of our message into %si
movb $0x00,%ah # 0x00 - set video mode
movb $0x03,%al # 0x03 - 80x25 text mode
int $0x10 # call into the BIOS

# Get random number

random:
movb $0x00, %al # store seconds register to %al
outb %al, $0x70 # select seconds register from CMOS RTC
inb $0x71, %al  # store value in %al
and $0x0F, %al # set all bits to 0 except for last
add $0x30, %al # convert to ASCII
movb %al, %bl  # store in %bl


print_char:
lodsb # loads a single byte from (%si) into %al and increments %si
testb %al,%al # checks to see if the byte is 0
jz get_value # if so, jump out (jz jumps if ZF in EFLAGS is set)
movb $0x0E,%ah # 0x0E is the BIOS code to print the single character
int $0x10 # call into the BIOS using a software interrupt
jmp print_char # go back to the start of the loop



get_value:

movb $0x00, %ah 
int $0x16    # read in ASCII
movb $0x0e,%ah 		# print character
int $0x10 		# call BIOS
mov %al, %cl # move value to %cl 

movb $0x0d,%al		# carriage return
movb $0x0e,%ah		# 0x0E is the BIOS code to print the single character
int $0x10		# call into the BIOS 
movb $0x0a,%al		# new line
movb $0x0e,%ah		# 0x0E is the BIOS code to print the single character
int $0x10		# call into the BIOS 

movw $right, %si # load the offset of right into %si
cmp %cl, %bl   # compare input to random num
je print_correct  # print correct if equal
movw $wrong, %si # load offset of wrong 
jmp print_wrong # print wrong if not correct


print_correct:
lodsb # loads a single byte from (%si) into %al and increments %si
testb %al,%al # checks to see if the byte is 0
jz done # if so, jump out (jz jumps if ZF in EFLAGS is set)
movb $0x0E,%ah # 0x0E is the BIOS code to print the single character
int $0x10 # call into the BIOS using a software interrupt
jmp print_correct # go back to the start of the loop

print_wrong:
lodsb # loads a single byte from (%si) into %al and increments %si
testb %al,%al # checks to see if the byte is 0
jz repeat # if so, jump out (jz jumps if ZF in EFLAGS is set)
movb $0x0E,%ah # 0x0E is the BIOS code to print the single character
int $0x10 # call into the BIOS using a software interrupt
jmp print_wrong # go back to the start of the loop

repeat:
movb $0x0d,%al		# print new line
movb $0x0e,%ah		# print character
int $0x10		# see display
movw $message, %si  # load offset of message
jmp print_char  # print message

done:
jmp done # loop forever
# The .string command inserts an ASCII string with a null terminator
message:
.string "What number am I guessing (0-9)?\n"
wrong:
.string "Wrong\n"
right:
.string "Correct!\n"


# This pads out the rest of the boot sector and then puts
 # the magic 0x55AA that the BIOS expects at the end, making sure
# we end up with 512 bytes in total.
#
# The somewhat cryptic "(. - start)" means "the current address
# minus the start of code", i.e. the size of the code we've written
# so far. So this will insert as many zeroes as are needed to make
# the boot sector 510 bytes log, and
.fill 510 - (. - start), 1, 0
.byte 0x55
.byte 0xAA
