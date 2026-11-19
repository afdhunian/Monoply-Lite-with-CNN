# Project Progress

Catatan perkembangan proyek **Monopoly Lite with CNN Dice Recognition on FPGA**.

## Status Saat Ini

Pengembangan CNN dan ekspor bobot INT8 sudah dilakukan. Beberapa modul dasar RTL Verilog dan satu testbench MAC juga sudah tersedia. Namun, integrasi CNN secara penuh, integrasi kamera, game engine, dan pengujian pada board FPGA masih perlu dikerjakan.

## 1. Completed

- [x] Menentukan konsep dan judul proyek.
- [x] Menyusun rancangan awal sistem Monopoly Lite.
- [x] Mengunduh dataset dadu beranotasi Pascal VOC dari Kaggle.
- [x] Melakukan cropping objek dadu berdasarkan bounding box XML.
- [x] Menyiapkan preprocessing citra grayscale berukuran 32 × 32 piksel.
- [x] Melatih model CNN menggunakan Python dan TensorFlow/Keras.
- [x] Mengevaluasi model Float dan INT8.
- [x] Mengekspor bobot, bias, parameter kuantisasi, dan data referensi pengujian.
- [x] Membuat modul dasar RTL: MAC, ReLU/Quantization, Max Pooling, Argmax, ROM bobot/bias, serta primitive Convolution dan Dense.
- [x] Membuat testbench dasar untuk pengujian MAC Unit.

## 2. In Progress

- [ ] Memverifikasi kesesuaian bobot dan bias hasil ekspor Python dengan file yang digunakan RTL.
- [ ] Mengembangkan datapath CNN lengkap yang menghubungkan Convolution, Pooling, dan Dense.
- [ ] Menghubungkan datapath dengan Controller hingga sinyal `done` dapat dihasilkan.
- [ ] Membuat testbench untuk setiap modul dan pengujian integrasi CNN.
- [ ] Membandingkan hasil simulasi RTL dengan output referensi Python.
- [ ] Memperbarui dokumentasi agar sesuai dengan implementasi aktual.

## 3. Planned

- [ ] Menyelesaikan dan memverifikasi inferensi CNN pada simulasi.
- [ ] Melakukan sintesis dan evaluasi penggunaan resource serta timing pada Quartus.
- [ ] Mengintegrasikan hasil pengenalan dadu dengan Game Logic Monopoly Lite.
- [ ] Mengembangkan tampilan permainan melalui VGA.
- [ ] Menentukan jalur integrasi kamera dengan FPGA/HPS.
- [ ] Melakukan pengujian sistem pada board DE10-Standard.

## 4. CNN Model Evaluation

Berdasarkan artefak evaluasi yang tersimpan:

| Metric | Result |
|---|---:|
| Training Samples | 734 |
| Validation Samples | 131 |
| Test Samples | 99 |
| Float Model Test Accuracy | 89.90% |
| INT8 Model Test Accuracy | 89.90% |
| Accepted Test Samples | 81.82% |
| Accuracy on Accepted Samples | 93.83% |

*Note: Hasil tersebut berasal dari evaluasi pada test dataset, bukan pengujian kamera secara langsung.*

## 5. Technical Information

- **FPGA Board:** Terasic DE10-Standard
- **FPGA Device:** Cyclone V SoC
- **CNN Input:** Grayscale image, 32 × 32 pixels
- **Number of Classes:** 6 (Dice values 1–6)
- **Weight Representation:** INT8
- **Hardware Description Language:** Verilog HDL

## 6. Development Log

- **18 November 2026:** Repository dibuat dan rancangan awal proyek disusun.
- **18–19 November 2026:** Pengembangan CNN, evaluasi Float/INT8, ekspor parameter, dan penambahan modul dasar RTL.

---

**Project:** Monopoly Lite with CNN Dice Recognition on FPGA  
**Development Platform:** Python, TensorFlow/Keras, Intel Quartus Prime, and Questa  
**Target Board:** Terasic DE10-Standard
