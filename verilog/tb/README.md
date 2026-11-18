# Testbench – CNN Verification

## Overview

This directory contains the Verilog testbench files used to verify and validate the functionality of the CNN hardware modules.

Testbenches are developed to simulate the behavior of individual RTL modules and evaluate their functionality before integration into the complete CNN architecture.

## Verification Objectives

- Verify MAC (Multiplication and Accumulation) operations.
- Test convolution module functionality.
- Validate ReLU and quantization operations.
- Verify max pooling and dense layer computations.
- Evaluate the overall CNN processing sequence.

## Simulation Environment

- **Simulation Tool:** Questa / ModelSim
- **Hardware Description Language:** Verilog
- **Design Platform:** Intel Quartus Prime

## Development Status

Testbench development and module verification are performed incrementally. Individual modules are tested before being integrated into the complete CNN design.
