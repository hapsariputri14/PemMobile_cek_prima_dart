void main() {
  print('=== PROGRAM CEK BILANGAN PRIMA ===');
  print('Tugas Mandiri Pemrograman Mobile');
  print('Implementasi Percabangan dan Perulangan\n');

  // Simulasi input (misalnya angka 17)
  int number = getValidInput(17);

  // Cek prima
  bool isPrime = checkPrime(number);

  // Tampilkan hasil
  displayResult(number, isPrime);
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


