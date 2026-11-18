# Dataset Documentation

## 1. Overview

This directory contains the dataset documentation and sample images used in the development of the CNN-based dice recognition system for the Monopoly Lite project.

The dataset consists of dice images in JPG format and their corresponding XML annotation files.

The dataset is used as the main data source for developing and training the Convolutional Neural Network (CNN) model.

## 2. Dataset Source

The dataset is obtained from Kaggle:

**Six-Sided Dice Images and Bounding Boxes**

Source: https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes

## 3. Dataset Information

| Description | Information |
|---|---|
| Dataset Type | Dice Images |
| Image Format | JPG |
| Annotation Format | XML |
| Number of Images | Approximately 500–1,000 |
| Dataset Size | Approximately 100 MB–1 GB |
| Data Source | Kaggle |

## 4. Directory Structure

```text
dataset/
│
├── README.md
│
├── sample/
│   ├── image_01.jpg
│   ├── image_01.xml
│   ├── image_02.jpg
│   └── image_02.xml
│
└── training/
    └── README.md
```

## 5. Sample Dataset

The `sample` directory contains selected example images and their corresponding XML annotation files.

These files demonstrate the original dataset format and annotation structure.

## 6. Dataset Preparation and Training

The complete dataset is downloaded from Kaggle in ZIP format.

The ZIP file is uploaded to Google Colab and extracted before being used in the CNN training process.

The preparation process includes:

1. Downloading the dataset from Kaggle.
2. Uploading the ZIP file to Google Colab.
3. Extracting the dataset.
4. Preparing image data and annotations.
5. Using the prepared data for CNN model development and training.

## 7. Full Dataset Access

The complete dataset is not stored directly in this GitHub repository due to its file size.

For access to the full dataset, please visit the original Kaggle source:

https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes

## 8. Notes

- Original image and annotation filenames are preserved.
- Each XML file corresponds to its respective image.
- Sample images are provided for documentation purposes.
- The complete dataset is maintained separately and used through Google Colab.

---

**Project:** Monopoly Lite with CNN  
**Directory:** Dataset Documentation
