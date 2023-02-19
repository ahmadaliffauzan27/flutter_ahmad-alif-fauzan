## GIT ##
Git adalah sebuah Version Control Server yang paling popular yang digunakan para developer untuk mengembangkan software secara bersama-sama.
Git merupakan salah satu version control system yang dipakai oleh developer untuk mengembangkan software bersama-sama. Git ini untuk merekam perubahan atau changes yang dilakukan para developer. Terdistribusi bukan tersentralisasi, karna masih menggunakan banyak komputer yang saling berhubungan dan untuk menghubungkan nya menggunakan git.

Git repository merupakan folder yang berisi file dan riwayat perubahan yang dilakukan. Git menggunakan commit untuk menyimpan riwayat perubahan yang terjadi pada project.

Git memiliki working directory, tempat dimana membuat perubahan file secara lokal dan staging area untuk menyimpan informasi tentang perubahan yang dilakukan untuk commit.

Merge merupakan penggabungan antara 2 branch atau lebih dalam repository git. Dalam proses merge sering terjadi merge conflict yang merupakan kasus pertentangan ketika proses merge antara kedua source berbeda.

## Rangkuman Kode ##
git branch "nama branch" (untuk membuat branch baru)
git status (untuk melihat apakah ada perubahan pada program)
git add . (untuk memproses perubahan tersebut ke stage area)
git commit -m "pesan" (untuk mengcommmit ke local)
git push 'remote' 'nama branch' (untuk push ke server atau github)