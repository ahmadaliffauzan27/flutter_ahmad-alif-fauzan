**_Flutter State Management_** merupakan konsep untuk mengatur dan memanipulasi data yang digunakan oleh widget-widget pada aplikasi Flutter. Salah satu metode untuk melakukan State Management pada Flutter adalah menggunakan Provider, sebuah package yang menyediakan state management dengan pendekatan "InheritedWidget" dan "ChangeNotifier".

Dalam **_Flutter Provider_**, ada tiga hal utama yang perlu dipahami, yaitu:

- ChangeNotifier
  sebuah class yang digunakan sebagai state, yang memiliki kemampuan untuk mengubah state dan memberitahu widget-widget terkait jika ada perubahan.

- Provider
  class yang digunakan untuk menghubungkan state dengan widget, sehingga widget dapat mengakses dan mengubah state tersebut.

- Consumer
  widget yang digunakan untuk mengubah tampilan ketika terjadi perubahan pada state, sehingga tidak perlu melakukan rebuild pada seluruh widget yang ada pada aplikasi.
