# Monopoly Lite with CNN Dice Recognition on FPGA
**Nama: Muhamad Afdhu**
**NIM : 101022330171**
Papan Monopoly Lite digital di layar VGA. Pemain melempar **dadu fisik** ke tray,
**CNN yang berjalan di FPGA** membaca angkanya lewat kamera, lalu FSM Verilog
mengurus giliran, uang, sewa, dan tampilan. Tanpa komputer dan tanpa internet.

**Board:** Terasic DE10-Standard (Cyclone V SoC)
**Status:** Tahap perancangan (belum ada kode)

## Ide singkat
Board FPGA yang bisa *melihat* dadu yang dilempar, lalu menjalankan permainan
Monopoly sendiri di layar. CNN hanya bertugas membaca angka dadu (1-6),
sedangkan aturan game dan tampilan dikerjakan oleh logika Verilog biasa.

## Aturan ringkas
- 2 pemain, modal awal Rp 2.000.000
- Papan 20 petak: properti, pajak, bonus, mundur, dan lainnya
- Pemain melempar dadu, pion maju, sistem mengevaluasi petak
- Bangkrut berarti kalah, atau pemenang ditentukan dari total kekayaan setelah 20 menit

## Isi repositori
| Lokasi | Isi |
|---|---|
| [`progress.md`](progress.md) | Catatan perkembangan proyek |
| [`progress/`](progress) | Dokumen rancangan (docx) dan gambar pendukung |

## Rencana pengerjaan
1. Perancangan sistem dan aturan game (sedang berjalan)
2. FSM game dan tampilan VGA dengan dadu simulasi
3. Dataset dan training CNN, lalu implementasi di Verilog
4. Integrasi kamera, CNN, FSM, dan VGA
5. Evaluasi: akurasi, latensi, dan pemakaian resource FPGA
