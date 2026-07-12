# Challenge 10: ModeMux

## Title
Configurable 4-Input Multiplexer with Fixed Priority and Round-Robin Arbitration


## Objective

Design a configurable multiplexer supporting four input requests and two arbitration modes:

1. Fixed Priority Mode
2. Round Robin Mode


## Description

ModeMux receives four request signals and selects one input based on the selected mode.

The module provides the selected input number through the grant output.


## Modes


### Fixed Priority Mode

Mode = 0

Priority:

Input3 > Input2 > Input1 > Input0


Example:

Request:

1111

Output:

Input3 selected



### Round Robin Mode

Mode = 1

Each input gets equal opportunity.

Example:

Request:

1111


Sequence:

Input0
Input1
Input2
Input3



## Inputs

| Signal | Description |
|--------|-------------|
| clk | Clock |
| reset | Reset |
| req[3:0] | Request inputs |
| mode | Mode selection |


## Outputs

| Signal | Description |
|--------|-------------|
| grant[1:0] | Selected input |
| valid | Valid grant indicator |


## Files
