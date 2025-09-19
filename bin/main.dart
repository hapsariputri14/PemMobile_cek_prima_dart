void main() {
  print('=== PROGRAM CEK BILANGAN PRIMA ===');
  print('Tugas Mandiri Pemrograman Mobile');
  print('Implementasi Percabangan dan Perulangan\n');

  // Simulasi input (misalnya angka 17)
  int number = getValidInput(17);
  print('Input berhasil divalidasi: $number');
  print('Program akan dikembangkan lebih lanjut...');
}

/// Fungsi untuk validasi input
int getValidInput(int input) {
  if (input <= 1) {
    throw Exception('Error: Angka harus lebih besar dari 1!');
  } else if (input > 1000000) {
    throw Exception('Error: Angka terlalu besar! Maksimal 1.000.000');
  } else {
    print('Input valid!');
    return input;
  }
}


