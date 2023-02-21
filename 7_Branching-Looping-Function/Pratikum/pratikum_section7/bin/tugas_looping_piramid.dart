// void main(){
//   var rows = 8;
//   for (int i = 1; i <= rows; i++){
//     //membuat spasi sebelum *
//     for (int j = 1; j <= rows - i; j++){
//       print("");
//     }

//     for (int k = 1; k <= 2 * i - 1; k++){
//       print("*");
//     }

//     print("");
//   }
// }

void main() {
  var rows = 8;
  for (int i = 1; i <= rows; i++) {
    print(' ' * (rows - i) + '*' * (2 * i - 1));
  }
}

// void main() {
//   int rows = 5;
//   for (int i = 1; i <= rows; i++) {
//     // membuat spasi sebelum karakter "*"
//     for (int j = 1; j <= rows - i; j++) {
//       print(" ");
//     }
//     // mencetak karakter "*" sebanyak 2 kali
//     for (int k = 1; k <= 2 * i - 1; k++) {
//       print("*");
//     }
//     // pindah ke baris baru
//     print("");
//   }
// }
