# Project Checkpoint1

This is the Second Project Checkpoint for my processor.

## Name & NetID

**Name:**  *Hongji(Kirk) Xu*
**NetID:** *hx84* 

## Implementation

My work is divided into four part: 

* Create an 8 to 1 mux to select the result corresponding to the opcode and output it to data_result
* Bitwise AND and bitwise OR operations on operand A through structural level modeling
* Building 32-bit barrel shifter with SLL (Logical Left Shift) and SRA (Arithmetic Right Shift)
* Output isNotEqual and isLessThan based on the result of subtraction

### Overview

Module *alu* is the top-level module in the project.
The entire project has a total of 15 .v files

* **alu.v**
* add_subtract.v
* CSA_32bit.v
* CSA_16bit.v
* RCA_8bit.v
* adder.v
* and_array.v
* or_array.v
* isEqualOrNot.v
* isLessThanOrNot.v
* LLS.v
* ARS.v
* mux_2_to_1.v
* mux_8_to_1.v

### Issues regarding warnings

There will be some warning prompts when doing RTL simulation. 
These warnings are caused by the fact that the inputs I provided to some modules 
(e.g. 8_to_1 mux) are less than the defined number of ports.
Because I explicitly declared the input for the corresponding port.

```
mux_8_to_1 mux1(.d0(result_add), .d1(result_substract), .d2(result_and), .d3(result_or), .d4(result_sll), .d5(result_sra), .s(ctrl_ALUopcode[2:0]), .out(data_result));
```


