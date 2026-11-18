# Dice Image Dataset

## Deskripsi
Folder ini digunakan untuk mendokumentasikan dataset citra dadu yang direncanakan sebagai sumber data pengembangan model **Convolutional Neural Network (CNN)** pada proyek **Monopoly Lite with CNN Dice Recognition**.

Dataset referensi: **Six Sided Dice Images and Bounding Boxes** oleh **josephnelson**, tersedia di Kaggle.

**Sumber:** https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes

## Tujuan penggunaan
- Menyiapkan citra dadu sebagai masukan pengembangan CNN.
- Mengembangkan sistem yang mengenali nilai dadu 1–6 dari citra kamera.
- Mempelajari anotasi *bounding box* untuk membantu menentukan area dadu sebelum klasifikasi.
- Menguji model dengan data terpisah setelah dataset diperiksa dan disiapkan.

## Informasi dataset
| Atribut | Keterangan |
|---|---|
| Nama | Six Sided Dice Images and Bounding Boxes |
| Platform | Kaggle |
| Pengunggah | josephnelson |
| Jenis data | Citra dadu enam sisi dan anotasi bounding box (sesuai judul dataset) |
| Tautan | [Buka dataset di Kaggle](https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes) |
| Jumlah gambar | Belum diverifikasi |
| Format berkas dan anotasi | Perlu diperiksa setelah mengunduh dataset |
| Lisensi | Periksa halaman Kaggle sebelum redistribusi |

## Contoh gambar
Simpan beberapa gambar asli dari dataset pada folder [`samples/`](samples/). Setelah diunggah, tambahkan tautan gambar pada tabel berikut.

| Sampel | Nama file | Keterangan |
|---|---|---|
| 1 | `samples/contoh-01.jpg` | Contoh citra dadu (unggah file terlebih dahulu) |
| 2 | `samples/contoh-02.jpg` | Contoh citra dadu (unggah file terlebih dahulu) |
| 3 | `samples/contoh-03.jpg` | Contoh citra dadu (unggah file terlebih dahulu) |

> Nama di atas hanya contoh. Sesuaikan nama dan ekstensi dengan file asli. Jangan menganggap gambar contoh telah tersedia sebelum diunggah.

## Rencana alur pengolahan
1. Unduh dataset dari Kaggle dan periksa isi serta lisensinya.
2. Identifikasi gambar dan format anotasi yang tersedia.
3. Periksa kualitas gambar dan distribusi label nilai dadu 1–6.
4. Siapkan *preprocessing* (misalnya crop, resize, dan normalisasi) sesuai kebutuhan model.
5. Pisahkan data latih, validasi, dan uji tanpa kebocoran data.
6. Latih dan evaluasi model CNN, lalu dokumentasikan hasilnya.
7. Rencanakan integrasi model ke sistem FPGA setelah hasil evaluasi memadai.

## Catatan
Dataset ini merupakan **referensi sumber data**, bukan bukti bahwa model CNN sudah dilatih atau terintegrasi ke FPGA. Statistik dataset, lisensi, contoh citra, dan hasil pengujian perlu ditambahkan setelah diverifikasi.

## Kredit
Sumber dataset: [josephnelson — Kaggle](https://www.kaggle.com/datasets/josephnelson/six-sided-dice-images-and-bounding-boxes). Hak penggunaan mengikuti ketentuan lisensi yang tercantum pada sumber asli.
