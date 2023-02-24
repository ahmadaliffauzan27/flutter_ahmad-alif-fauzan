## Branching ##
Branching merupakan konsep dalam pemrograman yang memungkinkan pengambilan keputusan berdasarkan dari suatu kondisi, disini dart menyediakan berbagai percabangan seperti "if", "else", dan "switch" yang memudahkan kita saat memilih jalur yang berbeda berdasarkan suatu kondisi.
contoh:

int num = 87;
if (num > 80){
    print('Nilai A');
} else if (num > 60){
    print('Nilai B');
} else {
    print('Nilai C');
}

## Looping ##
Looping atau perulangan adalah konsep dalam pemrograman yang memungkinkan sebuah blok kode dapat dieksekusi berulang kali hingga suatu kondisi tertentu tercapai. Dalam bahasa dart, ada beberapa jenis looping, seperti 'for', 'while', dan 'do while'.
Contoh:

for (int i = 0; i < 10; i++){
    print(i);
}

## Function ##
Function adalah blok kode yang dapat dipanggil secara berulang kali dalam pemrograman. Dart mendukung fungsi yang dapat didefinisikan sendiri, yang memungkinkan programmer untuk membuat fungsi mereka sendiri dan memanggilnya kapan saja.
Contoh:

void namaSaya(){
    print('Ahmad Alif Fauzan');
}
namaSaya();