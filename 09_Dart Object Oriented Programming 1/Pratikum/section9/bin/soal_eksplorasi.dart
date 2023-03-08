// Deklarasi class Book
class Book {
  int id; // atribut
  String title; 
  String publisher; 
  int price; 
  String category;

  // Konstruktor class Book
  Book(this.id, this.title, this.publisher, this.price, this.category);
}

// Deklarasi class BookStore
class BookStore {
  List<Book> books = []; // atribut daftar buku pada toko buku

  // Method untuk menambahkan buku
  Future<void> addBook(Book book) async {
    await Future.delayed(Duration(seconds: 1)); 
    books.add(book);
    print('Buku ${book.title} berhasil ditambahkan.');
  }

  // Method untuk mendapatkan semua buku
  Future<List<Book>> getAllBooks() async {
    await Future.delayed(Duration(seconds: 1)); 
    return books;
  }

  // Method untuk menghapus buku
  Future<void> removeBook(int id) async {
    await Future.delayed(Duration(seconds: 1)); 
    for (var book in books) {
      if (book.id == id) {
        books.remove(book);
        print('Buku ${book.title} berhasil dihapus.');
        return;
      }
    }
    print('Buku dengan ID $id tidak ditemukan.');
  }
}

void main() async {
  // Membuat objek toko buku
  var bookstore = BookStore();

  // Menambahkan beberapa buku
  await bookstore.addBook(Book(1, 'One Piece', 'Oda', 75000, 'Anime Manga'));
  await bookstore.addBook(Book(2, 'Habis Gelap Terbitlah Terang', 'Balai Pustaka', 120000, 'Perjuangan'));
  await bookstore.addBook(Book(3, 'Menghargai Waktu Shalat', 'Megawati', 95000, 'Pendidikan Agama'));

  // Mendapatkan semua buku
  var allBooks = await bookstore.getAllBooks();
  print('Daftar buku di toko buku:');
  for (var book in allBooks) {
    print('${book.id} - ${book.title} - ${book.publisher} - ${book.price} - ${book.category}');
  }
  print('---------------');

  // Menghapus buku dengan ID 2
  await bookstore.removeBook(2);

  // Mendapatkan semua buku setelah buku dengan ID 2 dihapus
  allBooks = await bookstore.getAllBooks();
  print('Daftar buku di toko buku setelah buku dengan ID 2 dihapus:');
  for (var book in allBooks) {
    print('${book.id} - ${book.title} - ${book.publisher} - ${book.price} - ${book.category}');
  }
}
