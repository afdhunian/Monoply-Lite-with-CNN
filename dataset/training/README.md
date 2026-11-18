# CNN Training Dataset

## 1. Overview

This directory documents the dataset preparation, preprocessing, and training workflow for the CNN-based Dice Recognition system in the Monopoly Lite project.

The dataset is obtained from Kaggle and processed using Python in Google Colab before being used for CNN model training.

## 2. Dataset Source

**Dataset Name:** Six-Sided Dice Images and Bounding Boxes

**Source:** Kaggle

**Dataset Link:**
https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes

**Original Data Format:**
- JPG: Original dice images.
- XML: Pascal VOC annotations containing object labels and bounding box coordinates.

## 3. Dataset Preparation

The dataset preparation process consists of the following stages:

### 3.1 Dataset Download

The original dataset is downloaded from Kaggle using the Kaggle API in Google Colab.

The downloaded ZIP archive is extracted into the raw dataset directory.

### 3.2 XML-Based Image Cropping

The XML annotation files are processed using Python's XML parser.

Bounding box coordinates (xmin, ymin, xmax, ymax) are extracted to identify and crop individual dice regions from the original images.

Only objects with class labels 1 through 6 are selected.

### 3.3 Class Organization

The cropped dice images are automatically organized into six class directories:

```text
dataset_dadu_cropped/
│
├── 1/
├── 2/
├── 3/
├── 4/
├── 5/
└── 6/
```

Each directory represents one dice face class.

## 4. Image Preprocessing

Before training, the cropped images undergo the following preprocessing operations:

| Parameter | Configuration |
|---|---|
| Color Mode | Grayscale |
| Image Resolution | 32 × 32 pixels |
| Input Channel | 1 |
| Batch Size | 32 |
| Data Split | 80% Training / 20% Validation |
| Random Seed | 42 |

### Data Augmentation

The training pipeline applies data augmentation techniques:

- Random horizontal and vertical flipping.
- Random rotation.
- Random contrast adjustment.

These operations help introduce image variations during training.

## 5. CNN Training Configuration

The CNN model is implemented using TensorFlow and Keras.

| Parameter | Configuration |
|---|---|
| Model Architecture | Lightweight CNN |
| Number of Classes | 6 |
| Epochs | 30 |
| Optimizer | Adam |
| Loss Function | Sparse Categorical Crossentropy |
| Evaluation Metric | Accuracy |
| Output Activation | Softmax |

### CNN Architecture

The model consists of:

1. Input Layer (32 × 32 × 1)
2. Convolutional Layer (8 filters)
3. Max Pooling Layer
4. Convolutional Layer (16 filters)
5. Max Pooling Layer
6. Convolutional Layer (32 filters)
7. Max Pooling Layer
8. Flatten Layer
9. Dense Layer (32 units)
10. Dropout Layer (0.2)
11. Output Layer (6 classes)

## 6. Training Output

The training process generates:

- Training accuracy.
- Validation accuracy.
- Training loss.
- Validation loss.
- CNN model weights and biases.

Training visualizations are documented separately in the project documentation directory.

## 7. FPGA Weight Export

After training, the CNN weights and biases are exported into 8-bit integer text files.

These files are prepared for further implementation and integration into the FPGA-based dice recognition system.

## 8. Notes

- The complete original dataset is not stored directly in this GitHub directory due to its size.
- Sample images and their XML annotations are available in the `sample` directory.
- The complete preprocessing and training implementation is available in the Python notebook.
- The generated cropped dataset is maintained in the Google Colab environment.

---

**Project:** Monopoly Lite with CNN  
**Module:** Dataset Preparation and CNN Training  
**Development Platform:** Google Colab  
**Framework:** TensorFlow / Keras
