void main() {
  print('=== PROGRAM CEK BILANGAN PRIMA ===');
  print('Tugas Mandiri Pemrograman Mobile');
  print('Implementasi Percabangan dan Perulangan\n');

  // Simulasi menu otomatis
  runMenu(1, 17); // Cek bilangan prima 17
  runMenu(1, 20); // Cek bilangan prima 20
  runMenu(2);     // Lihat history
  runMenu(3);     // Lihat statistik
  runMenu(4);     // Hapus history
  runMenu(2);     // Lihat history lagi (setelah dihapus)
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

/// Fungsi untuk cek bilangan prima 
bool checkPrime(int number) {
  if (number <= 1) return false;
  if (number <= 3) return true;
  if (number % 2 == 0 || number % 3 == 0) return false;

  for (int i = 5; i * i <= number; i += 6) {
    if (number % i == 0 || number % (i + 2) == 0) {
      return false;
    }
  }
  return true;
}

/// Fungsi untuk menampilkan hasil 
void displayResult(int number, bool isPrime) {
  print('\nHASIL PENGECEKAN');
  print('Bilangan: $number');

  if (isPrime) {
    print('Status: BILANGAN PRIMA');
    print('Faktor: 1, $number');
  } else {
    print('Status: BUKAN BILANGAN PRIMA');
    print('Faktor: ${getFactors(number).join(', ')}');
  }
}

/// Fungsi untuk mencari faktor 
List<int> getFactors(int number) {
  List<int> factors = [];
  int i = 1;

  while (i <= number) {
    if (number % i == 0) {
      factors.add(i);
    }
    i++;
  }
  return factors;
}

// Menyimpan history
List<Map<String, dynamic>> history = [];

// Simpan hasil ke history
void saveToHistory(int number, bool isPrime) {
  history.add({
    'number': number,
    'isPrime': isPrime,
  });
}

// Tampilkan history (for-in)
void displayHistory() {
  print('\n=== HISTORY PENGECEKAN ===');
  if (history.isEmpty) {
    print('Belum ada history.');
  } else {
    for (var record in history) {
      print(
          'Bilangan: ${record['number']}, Status: ${record['isPrime'] ? 'Prima' : 'Bukan Prima'}');
    }
  }
}

// Tampilkan statistik (do-while)
void displayStatistics() {
  print('\n=== STATISTIK ===');
  int total = history.length;
  int primeCount = history.where((r) => r['isPrime'] == true).length;

  int i = 0;
  do {
    print('Total dicek: $total, Jumlah prima: $primeCount');
    i++;
  } while (i < 1);
}

// Hapus history
void clearHistory() {
  history.clear();
  print('History berhasil dihapus.');
}

// Menu simulasi (switch-case)
void runMenu(int choice, [int? number]) {
  switch (choice) {
    case 1:
      int input = getValidInput(number ?? 17);
      bool isPrime = checkPrime(input);
      saveToHistory(input, isPrime);
      displayResult(input, isPrime);
      break;
    case 2:
      displayHistory();
      break;
    case 3:
      displayStatistics();
      break;
    case 4:
      clearHistory();
      break;
    default:
      print('Pilihan tidak valid.');
  }
}


