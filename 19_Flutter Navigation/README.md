**_Flutter Navigation_** dapat dilakukan dengan menggunakan Material Page Route. Material Page Route adalah widget navigasi yang digunakan untuk menampilkan halaman baru dalam aplikasi Flutter. Material Page Route digunakan dalam aplikasi yang menggunakan Material Design, karena widget ini menampilkan transisi antara halaman dengan animasi yang halus.

Untuk menggunakan Material Page Route, kita perlu mendefinisikan rute atau routes dalam aplikasi. Rute adalah konfigurasi navigasi antar halaman dalam aplikasi. Dalam definisi rute, kita perlu menentukan nama rute, widget halaman yang akan ditampilkan, dan fungsi untuk mengirim data atau parameter ke halaman tersebut.

Dalam menggunakan Material Page Route, kita dapat menggunakan beberapa jenis navigasi, seperti:

- Navigasi dengan menggunakan widget Navigator.
  Widget Navigator digunakan untuk mengelola tumpukan halaman dalam aplikasi. Setiap kali pengguna berpindah halaman, halaman tersebut akan ditambahkan ke dalam tumpukan. Pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol kembali pada perangkat.
  contoh kode:

          routes: {
          '/home': (context) => HomePage(),
          '/details': (context) => DetailsPage(),
        },

- Navigasi dengan parameter.
  Ketika berpindah halaman, kadang-kadang kita perlu untuk mengirim data atau parameter dari halaman sebelumnya ke halaman yang baru. Hal ini bisa dilakukan dengan menambahkan parameter pada method pushNamed pada widget Navigator.
  contoh kode:

        onPressed: () {
            Navigator.pushNamed(context, '/details', arguments: 'Hello from Home');
          },

- Navigasi dengan hasil kembali.
  Ketika pengguna selesai melakukan suatu tindakan pada halaman baru dan ingin kembali ke halaman sebelumnya, kadang-kadang kita perlu mengirim hasil tindakan tersebut ke halaman sebelumnya. Hal ini bisa dilakukan dengan menggunakan method pop pada widget Navigator.
  contoh kode:

        onPressed: () {
                Navigator.pop(context, 'Hello from Details');
              },
