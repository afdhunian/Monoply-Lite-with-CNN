# 🎲 Monopoly Lite with CNN Dice Recognition on FPGA

\<p align="center">   \<b>An FPGA-Based Digital Monopoly Game Powered by Convolutional Neural Network\</b> \</p>

\<p align="center">   \<img src="[https://img.shields.io/badge/Platform-FPGA-blue?style=for-the-badge](https://img.shields.io/badge/Platform-FPGA-blue?style=for-the-badge)">   \<img src="[https://img.shields.io/badge/Language-Verilog-green?style=for-the-badge](https://img.shields.io/badge/Language-Verilog-green?style=for-the-badge)">   \<img src="[https://img.shields.io/badge/AI-CNN-orange?style=for-the-badge](https://img.shields.io/badge/AI-CNN-orange?style=for-the-badge)">   \<img src="[https://img.shields.io/badge/Board-DE10--Standard-purple?style=for-the-badge](https://img.shields.io/badge/Board-DE10--Standard-purple?style=for-the-badge)"> \</p>

---

## 1. Project Overview

**Monopoly Lite with CNN Dice Recognition on FPGA** is an embedded digital board game that combines Artificial Intelligence (AI) and digital hardware implementation.

The system is designed to recognize physical dice values using a Convolutional Neural Network (CNN). A camera captures the dice image, and the CNN processes the image to classify the result into six possible classes (1–6).

The recognized dice value is then transferred to the FPGA-based game controller, which manages player turns, movement, property transactions, money management, and other game events.

The project aims to develop an interactive Monopoly-style game using the **Terasic DE10-Standard FPGA development board**.

### Project Information

| Category                      | Description                  |
| ----------------------------- | ---------------------------- |
| Project Name                  | Monopoly Lite with CNN       |
| Platform                      | Terasic DE10-Standard        |
| FPGA Device                   | Cyclone V SoC                |
| AI Algorithm                  | Convolutional Neural Network |
| Hardware Description Language | Verilog HDL                  |
| Display Interface             | VGA                          |
| Dice Classification           | 6 Classes (1–6)              |
| Number of Players             | 2 Players                    |
| Development Status            | In Progress                  |

---

## 2. System Architecture

The proposed system consists of several processing stages:

1. **Image Acquisition:** Capturing physical dice images using a camera.
2. **Image Processing:** Preparing the input image for CNN classification.
3. **CNN Inference:** Recognizing the dice value from 1 to 6.
4. **Game Logic:** Processing the dice result using FPGA-based Verilog logic.
5. **VGA Display:** Displaying the Monopoly game interface on a monitor.

### System Workflow

```text
       Physical Dice
             |
             v
           Camera
             |
             v
      Image Processing
             |
             v
         CNN Model
             |
             v
     Dice Classification
           (1–6)
             |
             v
      FPGA Game Logic
        (Verilog)
             |
             v
        Game Engine
             |
             v
         VGA Output
```

---

## 3. CNN Model Development

The CNN model is developed using Python and Jupyter Notebook before being prepared for hardware implementation.

The development process includes:

- Dataset preparation.
- Image preprocessing.
- CNN model training.
- Model evaluation.
- Weight extraction.
- INT8 quantization.
- Hardware-oriented implementation.

### 3.1 CNN Training Results

The following image shows the training results of the CNN model.



*Figure 1. CNN training results.*

### 3.2 Model Evaluation

The model evaluation includes a comparison between Float and INT8 quantized implementations.

**Float Model**



**INT8 Quantized Model**



*Figure 2. Comparison of classification performance between Float and INT8 models.*

---

## 4. CNN Class Mapping

This section documents the class mapping process used in the CNN model.

The classification system is designed to recognize six different dice values.

### Class Mapping Documentation

**Mapping Process 1**



**Mapping Process 2**



**Mapping Process 3**



**Mapping Process 4**



**Mapping Process 5**



**Mapping Process 6**



**Mapping Process 7**



---

## 5. INT8 Hardware Implementation

The CNN hardware implementation uses fixed-point INT8 representation to support efficient arithmetic operations on FPGA.

### 5.1 MAC INT8 Waveform Simulation

The Multiply-Accumulate (MAC) unit is an important computational component in CNN processing.



*Figure 3. MAC INT8 waveform simulation.*

### 5.2 Exported CNN Weights

This section contains documentation of the exported CNN model weights used for hardware implementation.

**Weight Documentation 1**



**Weight Documentation 2**



**Weight Documentation 3**



---

## 6. Questa Testbench Simulation

Questa Testbench is used to document the simulation and verification process of the hardware modules.

The following images present the simulation documentation.

### Simulation Documentation

**Simulation 1**



**Simulation 2**



**Simulation 3**



**Simulation 4**



**Simulation 5**



**Simulation 6**



**Simulation 7**



---

## 7. Hardware and Software

### Hardware

| Component             | Function                        |
| --------------------- | ------------------------------- |
| Terasic DE10-Standard | Main FPGA development board     |
| Cyclone V SoC         | Hardware processing platform    |
| Camera                | Physical dice image acquisition |
| VGA Monitor           | Game interface visualization    |
| Physical Dice         | Gameplay input                  |

### Software and Development Tools

| Software            | Function                             |
| ------------------- | ------------------------------------ |
| Python              | CNN development and preprocessing    |
| Jupyter Notebook    | Model training and experimentation   |
| Intel Quartus Prime | FPGA design and synthesis            |
| Verilog HDL         | Digital hardware implementation      |
| Questa              | Hardware simulation and verification |

---

## 8. Repository Structure

```text
Monopoly-Lite-with-CNN/
│
├── Python/
│   ├── Training_CNN_Dadu_Monopoly_Lite_ke2.ipynb
│   ├── monopoly lite.ipynb
│   └── README.md
│
├── algorithm/
│   ├── exported_weight_ke2/
│   └── exported_weights/
│
├── dataset/
│   ├── sample/
│   ├── training/
│   └── README.md
│
├── dokumentasi/
│   ├── MAC int8 Waveform/
│   ├── Mapping kelas/
│   ├── Questa Testbench/
│   ├── data hasil bobot/
│   ├── training_results/
│   ├── training_results_ke2/
│   ├── Monopoly Lite with CNN Dice Recognition.pdf
│   └── catatan.md
│
├── verilog/
│
├── progress.md
│
└── README.md
```

---

## 9. Development Roadmap

| No. | Development Stage                  | Status      |
| --- | ---------------------------------- | ----------- |
| 1   | System design and game rules       | In Progress |
| 2   | Dataset preparation                | In Progress |
| 3   | CNN training and evaluation        | In Progress |
| 4   | CNN weight export and quantization | In Progress |
| 5   | Verilog hardware implementation    | In Progress |
| 6   | Questa simulation and verification | In Progress |
| 7   | FPGA integration                   | Planned     |
| 8   | Camera and CNN integration         | Planned     |
| 9   | VGA game interface implementation  | Planned     |
| 10  | Final system testing               | Planned     |

---

## 10. Project Evaluation

The completed system will be evaluated based on the following parameters:

- CNN classification accuracy.
- Float and INT8 model performance.
- Hardware simulation results.
- Processing latency.
- FPGA resource utilization.
- System integration reliability.

---

## 11. Author

**Muhamad Afdhu**

Electrical Engineering
Telkom University

Student ID: 101022330171

---

\<p align="center">   \<b>Monopoly Lite with CNN Dice Recognition on FPGA\</b>   \<br>   \<i>Integrating Artificial Intelligence with FPGA-Based Digital Systems.\</i> \</p>
