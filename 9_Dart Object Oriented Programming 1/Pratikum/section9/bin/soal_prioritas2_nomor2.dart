// Deklarasi class Course
class Course {
  String title; // atribut judul course
  String description; // atribut deskripsi course

  // Konstruktor class Course
  Course(this.title, this.description);
}

// Deklarasi class Student
class Student {
  String name; // atribut nama student
  String className; // atribut kelas student
  List<Course> courses = []; // atribut daftar course student

  // Konstruktor class Student
  Student(this.name, this.className);

  // Method untuk menambahkan course
  void addCourse(Course course) {
    courses.add(course);
  }

  // Method untuk menghapus course
  void removeCourse(Course course) {
    courses.remove(course);
  }

  // Method untuk melihat semua course
  void viewCourses() {
    print("Daftar Course yang dimiliki:");
    for (var course in courses) {
      print("${course.title} - ${course.description}");
    }
  }
}

void main() {
  // Membuat objek course
  var course1 = Course("Mobile Programming", "Belajar fundamental bahasa dart");
  var course2 = Course("Matematika", "Belajar pluang");
  var course3 = Course("Agama", "Belajar menghargai waktu shalat di bulan ramadhan");

  // Membuat objek student
  var student1 = Student("Alif", "TI SE");
  var student2 = Student("Fauzan", "TI IS");

  // Menambahkan course untuk student1
  student1.addCourse(course1);
  student1.addCourse(course2);
  student1.addCourse(course3);

  // Menambahkan course untuk student2
  student2.addCourse(course3);
  student2.addCourse(course2);

  // Menampilkan semua course untuk student1
  print("${student1.name} (${student1.className})");
  student1.viewCourses();
  print('---------------');

  // Menampilkan semua course untuk student2
  print("${student2.name} (${student2.className})");
  student2.viewCourses();
  print('---------------');

  // Menghapus course untuk student1
  student1.removeCourse(course2);

  // Menghapus course untuk student2
  student2.removeCourse(course1);


  // Menampilkan semua course untuk student1 setelah menghapus course
  print("${student1.name} (${student1.className}) setelah menghapus course:");
  student1.viewCourses();
  print('---------------');

    // Menampilkan semua course untuk student2 setelah menghapus course
  print("${student2.name} (${student2.className}) setelah menghapus course:");
  student1.viewCourses();
  print('---------------');
}
