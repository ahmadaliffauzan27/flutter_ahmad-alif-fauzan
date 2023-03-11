***Flutter CLI (Command Line Interface)*** adalah alat baris perintah yang digunakan untuk mengembangkan aplikasi Flutter. Alat ini memungkinkan pengembang untuk memeriksa ketersediaan alat-alat pengembangan, mengelola versi SDK Flutter, mengelola paket pub, dan menjalankan kode.

####Beberapa Important CLI Commands dalam Flutter adalah:

- flutter create: perintah untuk membuat proyek baru Flutter.

Contoh: 

    flutter create my_app

- flutter run: perintah untuk menjalankan aplikasi Flutter pada emulator atau perangkat fisik.

Contoh: 

    flutter run

flutter doctor: perintah untuk memeriksa konfigurasi alat-alat pengembangan.

Contoh: 

    flutter doctor


***Packages Management*** pada Flutter dapat dilakukan menggunakan Flutter Packages atau pub. Ada dua jenis package yang dapat digunakan, yaitu paket bawaan Flutter dan paket pub yang dibuat oleh pengembang lain.

####Beberapa contoh Packages Management di Flutter adalah:

- flutter packages get: perintah untuk mengunduh dan memperbarui paket-paket pub yang dibutuhkan oleh proyek.

Contoh: 

    flutter packages get

- flutter packages upgrade: perintah untuk memperbarui paket-paket pub ke versi terbaru.

Contoh: 

    flutter packages upgrade

- pubspec.yaml: berkas YAML yang digunakan untuk mengelola paket-paket pub yang dibutuhkan oleh proyek.

####Beberapa contoh paket pub di Flutter adalah:

- http: paket pub yang digunakan untuk membuat permintaan HTTP.

Contoh: 

    import 'package:http/http.dart' as http;

- google_maps_flutter: paket pub yang digunakan untuk menampilkan peta Google Maps pada aplikasi Flutter.

Contoh: 

    import 'package:google_maps_flutter/google_maps_flutter.dart';

- provider: paket pub yang digunakan untuk mengelola state pada aplikasi Flutter.

Contoh: 

    import 'package:provider/provider.dart';