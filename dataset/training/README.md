# CNN Training Dataset

This directory documents the dataset preparation, image preprocessing, and CNN training workflow for the dice recognition system in the **Monopoly Lite with CNN Dice Recognition on FPGA** project.

## 1. Dataset Source

**Dataset Name:** Six-Sided Dice Images and Bounding Boxes  
**Platform:** Kaggle

**Dataset Link:**  
https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes

The original dataset contains:

- **JPG:** Original dice images.
- **XML:** Pascal VOC annotations containing object labels and bounding box coordinates.

The Kaggle dataset is used as the initial data source for training the dice recognition model.

## 2. Dataset Preparation

The dataset preparation process consists of the following steps:

1. Downloading and extracting the original dataset.
2. Reading Pascal VOC XML annotation files.
3. Extracting bounding box coordinates (`xmin`, `ymin`, `xmax`, `ymax`).
4. Cropping individual dice objects from the original images.
5. Selecting objects with class labels from 1 to 6.
6. Organizing the cropped images into six class directories.

### Dataset Class Structure

\`\`\`text
dataset_dadu_cropped/
├── 1/
├── 2/
├── 3/
├── 4/
├── 5/
└── 6/
\`\`\`

Each directory represents one dice face class.

## 3. Image Preprocessing

Before being used for CNN training, the cropped images undergo preprocessing.

| Parameter | Configuration |
|---|---|
| Color Mode | Grayscale |
| Image Resolution | 32 × 32 pixels |
| Input Channel | 1 |
| Crop Margin | 15% |
| Minimum Original Crop Size | 32 pixels |
| Random Seed | 42 |

### Dataset Splitting

The dataset is divided using **GroupShuffleSplit**, based on the source image.

This approach helps prevent images cropped from the same original photograph from appearing in different subsets.

The exported dataset evaluation contains:

| Dataset Subset | Number of Samples |
|---|---:|
| Training | 734 |
| Validation | 131 |
| Testing | 99 |
| **Total** | **964** |

## 4. Data Augmentation

Several augmentation techniques are applied during training to improve model generalization.

The techniques include:

- Horizontal and vertical flipping.
- Random rotation up to ±180°.
- Image translation.
- Random zoom.
- Brightness adjustment.
- Contrast adjustment.
- Noise addition.

These techniques introduce image variations and help the model learn different dice appearances.

## 5. CNN Training Configuration

The CNN model is developed using Python and TensorFlow/Keras.

| Parameter | Configuration |
|---|---|
| Input Shape | 32 × 32 × 1 |
| Number of Classes | 6 |
| Maximum Epochs | 150 |
| Batch Size | 64 |
| Optimizer | Adam |
| Initial Learning Rate | 0.001 |
| Loss Function | Sparse Categorical Crossentropy (from logits) |
| Dropout Rate | 0.3 |
| Early Stopping Patience | 20 |
| Reduce LR Patience | 7 |
| Random Seed | 42 |

The training process uses **EarlyStopping** and **ReduceLROnPlateau** callbacks.

The maximum epoch value is 150. The actual number of training epochs may be lower depending on the early stopping condition.

### CNN Architecture

The CNN architecture consists of the following layers:

1. Input Layer: 32 × 32 × 1.
2. Convolutional Layer: 8 filters, 3 × 3 kernel, ReLU activation.
3. Max Pooling Layer.
4. Convolutional Layer: 16 filters, 3 × 3 kernel, ReLU activation.
5. Max Pooling Layer.
6. Convolutional Layer: 32 filters, 3 × 3 kernel, ReLU activation.
7. Flatten Layer.
8. Dropout Layer: 0.3.
9. Dense Output Layer: 6 logits.

The output layer produces six logit values corresponding to dice classes 1 through 6.

## 6. Model Evaluation

The model is evaluated using a separate test dataset.

The exported evaluation results are:

| Metric | Float Model | INT8 Model |
|---|---:|---:|
| Test Accuracy | 89.90% | 89.90% |

Additional evaluation using the confidence/margin filter:

- Accepted test samples: 81.82%.
- Accuracy on accepted samples: 93.83%.

These results represent evaluation on the available test dataset. Additional testing using actual camera images is required to evaluate performance under real operating conditions.

## 7. INT8 Quantization and Weight Export

After training and evaluation, the CNN parameters are exported for FPGA hardware implementation.

The exported parameters include:

- Convolution weights.
- Convolution biases.
- Dense layer weights.
- Dense layer biases.
- Quantization multipliers and shift values.

The exported model files are available in:

\`\`\`text
algorithm/
└── exported_weight_ke2/
\`\`\`

The directory also contains reference test data, including test images, labels, logits, and INT8 predictions.

These reference files can be used to compare the Python model outputs with the results produced by the Verilog implementation.

## 8. Notes

- The complete original dataset is not stored in this repository because of its size.
- Sample JPG images and XML annotations are available in the `dataset/sample/` directory.
- The main CNN training notebook is available in the `Python/` directory.
- The Kaggle dataset is the initial training source; actual camera samples are still needed for real-world validation.
- The exported weights, biases, and quantization parameters used by the RTL implementation should come from the same model export version.
- During simulation, ensure that the ROM initialization files can be found through the simulator working directory or the configured `MEM_FILE` parameter.

---

**Project:** Monopoly Lite with CNN Dice Recognition on FPGA  
**Module:** Dataset Preparation and CNN Training  
**Development Platform:** Google Colab / Python  
**Framework:** TensorFlow / Keras
