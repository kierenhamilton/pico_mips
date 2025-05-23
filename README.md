# PicoMIPS processor

## Feature-list
- Implements Gaussian blur
- 110 ALM (Altera FPGA)
- Custom instructionset
- Reads programs into Program Memory and ROM

## Build instructions
Built using Cadence Xcelium and the scripts available on 
my Universities CAD system.
- TODO: Verilator scripting
# Detailed breakdown
## RAM 

### REGISTERS
0 : sswitch
1 : index_rom
2 : mult_result
3 : accumulator
4 : ONE

## ROM

### REGISTERS: 256

stored from wave.hex

## decoder

### Control Flags

- ram_flag 

0: Wdata_ram = prog_value

1: Wdata_ram = result_alu

- alu_flag

0:  input1 = Rdata_rom; 
    input2 = prog_value;

1:  input1 = rdata1_ram;
    input2 = rdata2_ram;

- reset_pc
    Sets the program counter to 0

- hold_pc
    The program counter will not increment unless a condition is met

- nw

0: write to the ram
1: read from the ram 

- alu_ctrl 

0: add
1: mult

### Instructions

- ADD
    nw = 0 // write 
    ram_flag = 1; // rdata1_ram + rdata2_ram
    alu_flag = 1; // rdata1_ram + rdata2_ram
    alu_ctrl = 0; // addition
    reset_pc = 0;
    hold_pc = 0;

- IMM
    nw = 0 // write
    ram_flag = 0 // prog_value
    alu_flag = 0 // though it doesnt matter
    alu_ctrl = 0 // doesnt matter
    reset_pc = 0;
    hold_pc = 0;
    
- MULT
    nw = 0 // write
    ram_flag = 1 // result
    alu_flag = 0 // multiply kernal with rom address
    alu_ctrl = 1 // multiply
    reset_pc = 0;
    hold_pc = 0;

- RBRA
    nw = 1 // read only
    ram_flag = 0 // doesnt matter
    alu_flag = 0 // doesnt matter
    alu_ctrl = 0 // doesnt matter

    if (prog_value[0]) { // if the lsb of the RBRA is 1 then reset. 
                            else wait until sw8 == prog_value[1]
        reset_pc = 1;
        hold_pc = 0;
    } else {
        reset_pc = 0;
        hold_pc = 1; 
    }

## program counter

responsible for incrementing the PC by 1 each clock
cycle unless

Branch:

lsb == 0 -> if (sw8 == [1]) PC++;

lab == 1 -> PC = 0;
 

## ALU

Either add or multiply input 1 and 2.
order of input1 and input 2 does not matter.

alu_ctrl:   0 = mult
            1 = add

## program memory

stores 13 bit long instructions. 

program is 22 lines long.

inputs program count 
returns the binary 


