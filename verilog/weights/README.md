# CNN Weights and Biases

## Overview

This directory contains the quantized weights, biases, and model parameters exported from the trained Convolutional Neural Network (CNN).

These files are used as reference data for the hardware implementation of the CNN inference process on the FPGA DE10-Standard.

## Model Parameters

The CNN model consists of three convolutional layers and one dense layer.

The exported parameters include:

| File | Description |
|---|---|
| `conv1_w.mem` | Conv1 weights |
| `conv1_b.mem` | Conv1 biases |
| `conv2_w.mem` | Conv2 weights |
| `conv2_b.mem` | Conv2 biases |
| `conv3_w.mem` | Conv3 weights |
| `conv3_b.mem` | Conv3 biases |
| `dense_w.mem` | Dense layer weights |
| `dense_b.mem` | Dense layer biases |
| `params.vh` | CNN model configuration and quantization parameters |

## Data Format

- Weights use signed INT8 representation.
- Activations use unsigned UINT8 representation.
- Biases use INT32 representation.
- Weight and bias files are exported in hexadecimal format.

## Purpose

The exported parameters are intended to be loaded into the FPGA hardware design and used during CNN inference.

The parameter files maintain consistency between the trained CNN model and its hardware implementation.

## Source

The parameters are generated from the CNN training and quantization process using Python and TensorFlow/Keras.
