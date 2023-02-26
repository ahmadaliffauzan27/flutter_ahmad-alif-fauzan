// void main(){
// int number = 12;
// List faktor = [];

// for (int i = 1; i <= number; i++){
// if (number % i == 0) {
//   faktor.add(i);
// }
// }
// if (faktor.length > 2){
// print('$number bukan bilangan prima');
// } else {
// print('$number adalah bilangan prima');
// }
// }

import 'dart:io';
void main() {
  stdout.write('Masukkan sebuah bilangan: ');
  int number = int.parse(stdin.readLineSync()!);
  
  if (isPrime(number)) {
    print('Bilangan $number adalah bilangan prima');
  } else {
    print('Bilangan $number bukan bilangan prima');
  }
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  
  return true;
}


// void main() {
//   int num = 12;
  
//   if (isPrime(num)) {
//     print("$num adalah bilangan prima");
//   } else {
//     print("$num bukan bilangan prima");
//   }
// }

// bool isPrime(int num) {
//   if (num <= 1) {
//     return false;
//   }
  
//   for (int i = 2; i <= num / 2; i++) {
//     if (num % i == 0) {
//       return false;
//     }
//   }
  
//   return true;
// }
