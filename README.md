# Tugas Akhir Semester PBP

## Anggota Kelompok :

- Adrian Hakim Utomo - 2006597613

- Adlan Walid Muntashir - 2006597683

- Akbar Maliki Haqoni Jati - 2006596232

- Alma Aqila Hansa - 2006597626

- Faris Haidar Zuhdi - 2006597336

- Kartika Dian Pratiwi - 2006596270

---

## Deskripsi singkat :
### **Vaksinfo**

Vaksinfo adalah website penyedia informasi bagi masyarakat Indonesia yang menyediakan informasi seputar lokasi vaksin, info tentang vaksin-vaksin yang beredar di Indonesia, artikel berita dan tips-tips menjalani aktivitas selama pandemi, serta statistik COVID-19 di Indonesia.

Vaksinfo juga dilengkapi dengan fitur yang bisa digunakan oleh user untuk menyampaikan kritik, saran, atau pertanyaan terkait website.

---

## Daftar Modul :
- **Beranda**\
Pada modul beranda, kami akan membuat suatu layout yang terdiri atas widget _drawer_ beserta _list_ menunya, _slider_ (untuk menampilkan gambar _highlight_ berita/artikel), beserta kumpulan _input form_ untuk keperluan fitur feedback. Pada fitur _feedback_ ini, _user_ yang dapat mengisi _feedback_ adalah _user_ yang telah melakukan _login_.  Sehingga, program akan membaca data dari database Django apakah _user_ sudah terdaftar sebagai user yang sudah _login_ atau belum.

- **User Login**\
Pada modul ini kami akan membuat login form menggunakan form yang terdapat pada flutter. Selain itu, pada modul ini kami juga akan menggunakan pemanggilan asynchronous HTTP get untuk memvalidasi akun user yang dimasukkan pada form login. Kami akan mengintegrasikan webapp yang kami buat dengan aplikasi yang akan kami buat dengan membuat suatu views pada webapp kami agar aplikasi dapat mengirim data ke webapp lalu akan diproses oleh views yang terdapat pada webapp dan melakukan validasi terhadap user yang masuk.

- **Artikel (Berita dan tips & tricks)**\
Pada modul Artikel, kami akan menampilkan artikel-artikel seputar COVID-19. User dengan status admin dapat menambahkan artikel baru dengan sebuah form, sedangkan pengguna hanya dapat membaca artikel. Kemudian, modul  ini akan terintegrasi dengan data pada webapp apabila dilakukan update.

- **Info Lokasi Vaksin**\
Pada modul Info Lokasi Vaksin, kami akan menampilkan lokasi-lokasi vaksin yang tersedia. Info lokasi vaksin yang tersedia didapat dari admin yang menambahkan lokas vaksin dengan form. Jika hanya tamu, maka hanya terdapat tampilan lokasi yang terseda, namun bila yang login adalah admin, maka dapat menambahkan lokasi vaksin yang baru.

- **Info Vaksin di Indonesia**\
Pada modul Info Vaksin, kami akan menampilkan info-info vaksin yang ada di Indonesia. Informasi tiap vaksin disimpan pada text JSON di webapp vaksinfo. Kami akan mengintegrasikan webapp yang kami buat dengan cara melakukan pemanggilan Asynchronus JSON menggunakan flutter untuk menampilkan informasi tersebut. Pada modul ini kami juga akan membuat form yang dapat digunakan user untuk memberikan komen tentang vaksin yang suda diambil.

- **Statistik**\
Pada modul statistik, kami akan menampilkan statistik vaksinasi dan juga kasus COVID-19 di Indonesia. Integrasi modul ini dapat dilakukan dengan mengakses endpoint API yang sama, yaitu API data COVID-19 nasional yang bersumber dari Kemenkes. Pemanggilan API tersebut akan bersifat asynchronous dengan time data yang dikembalikan yaitu objek JSON. Melalui data tersebut, akan dirender berbagai grafik/bagan yang bersesuaian. 

- **Tanya Jawab**\
Pada modul tanya jawab, kami akan menampilkan jawaban terkait pertanyaan-pertanyaan umum seputar informasi vaksinasi. Pada modul ini akan membuat layout yang terdiri atas widget expansion panel untuk menyimpan pertanyaan dan jawabannya. Selain itu, modul ini juga memiliki widget form untuk input pertanyaan dari user yang telah login.
---

## Download Link:
[Click Here!](https://drive.google.com/drive/folders/1pqjNwcK2jCj8TKNE8UDA7w7JD4H3NLa4?usp=sharing)
