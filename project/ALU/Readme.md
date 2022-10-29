# Project Checkpoint1

This is the first Project Checkpoint for my processor.

## Name & NetID

**Name:**  *Hongji(Kirk) Xu*
**NetID:** *hx84* 

## Implementation

My work is divided into two main parts: 

* Building a 32-bit CSA
* Detecting overflow

### Overview

All modules of the entire project are placed in the *alu.v* file. It consists of a total of 6 modules. 
Module *alu* is the top-level module in the project.
Module *add_subtract* is used to implement addition, subtraction and overflow detection simultaneously.
For the selection of addition and subtraction operators, only the least significant bit in the *opcode* is input as the selection signal in *add_subtract*.

* **alu**
* add_subtract
* CSA_32bit
* CSA_16bit
* RCA_8bit
* adder

### Building a 32-bit CSA

I build a 32-bit CSA based on 8-bit RCAs.

```
The 8-bit RCA is a series connection of 1-bit full adders, with an additional overflow port added to the output compared to the full adder in recitation. 
This port is used to output the Cout of the second most significant bit.
```

### Detecting overflow

For Signed: XOR Cin and Cout of last bit addition.

```
Cin is output by the previously mentioned overflow port.
```


