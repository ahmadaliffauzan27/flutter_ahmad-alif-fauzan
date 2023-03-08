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
Future<void> addCourse(Course course) async {
await Future.delayed(Duration(seconds: 1)); // contoh tambahan delay
courses.add(course);
}

// Method untuk menghapus course
Future<void> removeCourse(Course course) async {
await Future.delayed(Duration(seconds: 1)); // contoh tambahan delay
courses.remove(course);
}

// Method untuk melihat semua course
Future<void> viewCourses() async {
await Future.delayed(Duration(seconds: 1)); // contoh tambahan delay
print("Daftar Course yang dimiliki:");
for (var course in courses) {
print("${course.title} - ${course.description}");
}
}
}

void main() async {
// Membuat objek course
var course1 = Course("Mobile Programming", "Belajar fundamental bahasa dart");
var course2 = Course("Matematika", "Belajar peluang");
var course3 = Course("Agama", "Belajar menghargai waktu shalat di bulan ramadhan");

// Membuat objek student
var student1 = Student("Alif", "TI SE");
var student2 = Student("Fauzan", "TI IS");

// Menambahkan course untuk student1
await student1.addCourse(course1);
await student1.addCourse(course2);
await student1.addCourse(course3);

// Menambahkan course untuk student2
await student2.addCourse(course3);
await student2.addCourse(course2);

// Menampilkan semua course untuk student1
print("${student1.name} (${student1.className})");
await student1.viewCourses();
print('---------------');

// Menampilkan semua course untuk student2
print("${student2.name} (${student2.className})");
await student2.viewCourses();
print('---------------');

// Menghapus course untuk student1
await student1.removeCourse(course2);

// Menghapus course untuk student2
await student2.removeCourse(course1);

// Menampilkan semua course untuk student1 setelah menghapus course
print("${student1.name} (${student1.className}) setelah menghapus course:");
await student1.viewCourses();
print('---------------');

// Menampilkan semua course untuk student2 setelah menghapus course
print("${student2.name} (${student2.className}) setelah menghapus course:");
await student2.viewCourses();
print('---------------');
}