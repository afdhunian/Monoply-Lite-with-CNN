# 02. Algoritma & Golden Model (Python)

Folder ini berisi implementasi perangkat lunak (Python) dari Convolutional Neural Network (CNN) untuk klasifikasi citra dadu (minimal 32x32 piksel) sebagai acuan konseptual (*golden model*) sebelum diwujudkan ke dalam perangkat keras Verilog.

## Struktur Isi Folder:
- `train_cnn.py`: Skrip pelatihan model CNN.
- `exported_weights/`: Berisi file teks mentah bobot (*weights*) dan bias hasil *training* (`layer_2`, `layer_4`, `layer_6`, `layer_9`, `layer_11`).
