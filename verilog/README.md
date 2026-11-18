# Verilog – CNN Hardware Implementation

## Overview

This directory contains the Verilog source code and hardware design files for the Convolutional Neural Network (CNN) implementation of the Monopoly Lite dice recognition system.

The CNN model is developed and trained using Python and TensorFlow/Keras. The trained model is then converted into quantized parameters to support hardware implementation on the FPGA DE10-Standard board.

The main objective is to implement the CNN inference process in digital hardware using Verilog, allowing the FPGA to process dice images and classify them into six classes (dice numbers 1–6).

## Project Objectives

- Implement the trained CNN architecture using Verilog.
- Develop modular RTL components for CNN operations.
- Implement fixed-point and integer-based computations using INT8 weights and UINT8 activations.
- Integrate convolution, activation, pooling, and dense layer operations.
- Prepare the hardware design for FPGA synthesis and simulation.

## Directory Structure

```text
verilog/
├── rtl/
├── tb/
├── weights/
└── README.md
```

### 1. RTL (Register Transfer Level)

Contains the Verilog source code for the CNN hardware architecture, including the main module and supporting processing modules.

Planned modules include:
- CNN Top Module
- Convolution Layer
- MAC Unit
- ReLU and Quantization
- Max Pooling
- Dense Layer
- Weight and Bias ROM
- Argmax
- Controller

### 2. Testbench (TB)

Contains testbench files used to verify the functionality of the Verilog modules through simulation.

Simulation is used to check arithmetic operations, module behavior, and data processing before FPGA implementation.

### 3. Weights

Contains the quantized weights, biases, and model parameters exported from the CNN training process.

The files are used as reference data for hardware implementation.

## CNN Architecture

The CNN model consists of the following processing stages:

1. Input Image: 32 × 32 grayscale image.
2. Convolution Layer 1: 8 filters, followed by ReLU and Max Pooling.
3. Convolution Layer 2: 16 filters, followed by ReLU and Max Pooling.
4. Convolution Layer 3: 32 filters, followed by ReLU.
5. Flatten: Converts feature maps into a 512-element vector.
6. Dense Layer: Produces six output logits.
7. Argmax: Selects the predicted dice class.

## Development Tools

- **HDL:** Verilog
- **FPGA Board:** DE10-Standard
- **FPGA Software:** Intel Quartus Prime
- **Simulation:** Questa / ModelSim
- **CNN Framework:** TensorFlow / Keras
- **Quantization:** INT8 Weights and UINT8 Activations

## Development Status

This directory is used to organize the RTL development, simulation, and hardware implementation of the CNN model.

The design is being developed incrementally, starting from individual arithmetic modules and progressing toward full CNN integration.

Further verification and FPGA implementation will be performed as the development progresses.

---

**Project:** Monopoly Lite with CNN  
**Hardware Platform:** FPGA DE10-Standard
