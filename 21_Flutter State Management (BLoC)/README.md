**_Flutter State Management menggunakan BloC (Business Logic Component)_** adalah salah satu teknik yang digunakan dalam Flutter untuk mengatur state pada aplikasi. BloC terdiri dari tiga konsep utama yaitu **_Business Logic, Events, dan State_**.

- **_Business Logic_** adalah logika bisnis dari sebuah aplikasi, yaitu bagaimana data diambil, diproses, dan disimpan. Business Logic pada BloC dimodelkan sebagai class yang mengimplementasikan algoritma yang mendefinisikan cara bagaimana data state akan diubah dan dikelola.

- **_Events_** adalah aksi atau kejadian yang terjadi pada aplikasi, seperti penggunaan tombol atau input dari pengguna. Events pada BloC dimodelkan sebagai stream yang mengirimkan data ke BloC.

- **_State_** adalah data state dari sebuah aplikasi, yaitu bagaimana tampilan dan data di-update pada aplikasi. State pada BloC dimodelkan sebagai class yang menyimpan data state dan akan diubah oleh BloC ketika menerima event dari widget.
