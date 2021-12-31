import 'package:beranda/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'questionbox.dart';


class TanyaJawabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  
        child: Column(
          children:<Widget>[
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Apa itu Vaksin?",
              content: "Vaksin adalah produk biologi yang berisi antigen berupa mikroorganisme atau bagiannya atau zat yang dihasilkannya yang telah diolah sedemikian rupa sehingga aman, yang apabila diberikan kepada seseorang akan menimbulkan kekebalan spesifik secara aktif terhadap penyakit tertentu.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Apa itu Vaksinasi?",
              content:
                "Vaksinasi adalah pemberian Vaksin dalam rangka menimbulkan atau meningkatkan kekebalan seseorang secara aktif terhadap suatu penyakit, sehingga apabila suatu saat terpajan dengan penyakit tersebut tidak akan sakit atau hanya mengalami sakit ringan dan tidak menjadi sumber penularan.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Bagaimana Vaksin bisa bekerja dalam tubuh untuk melindungi kita?",
              content: "1. Vaksin adalah produk biologi yang diberikan kepada seseorang untuk melindunginya dari penyakit yang melemahkan, bahkan mengancam jiwa.\n2. Vaksin akan merangsang pembentukan kekebalan terhadap penyakit tertentu pada tubuh seseorang.\n3. Tubuh akan mengingat virus atau bakteri pembawa penyakit, mengenali dan tahu cara melawannya.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Apakah ada efek samping dari vaksinasi?",
              content: "- Secara umum, efek samping yang timbul dapat beragam pada umumnya ringan dan bersifat sementara, dan tidak selalu ada, serta bergantung pada kondisi tubuh. Efek seperti demam dan nyeri otot atau kemerahan pada bekas suntikan adalah hal yang wajar namun tetap perlu dimonitor.\n- Manfaat vaksin jauh lebih besar dibandingkan risiko sakit karena terinfeksi bila tidak divaksin.\n- Apabila terjadi Kejadian Ikutan Pasca Imunisasi (KIPI), dapat dilaporkan kepada Fasyankes tempat pemberian vaksinasi, kemudian akan ditindaklanjuti oleh focal point yang ada di masing-masing Dinas Kesehatan dan dikaji oleh Komite Pengkajian dan Penanggulangan KIPI yang ada di setiap daerah maupun Nasional.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Apakah vaksin COVID-19 itu dipastikan aman?",
              content: "- Vaksin yang diproduksi masal sudah melewati proses yang panjang dan harus memenuhi syarat utama yakni: Aman, Ampuh, Stabil dan Efisien dari segi biaya.\n- Aspek keamanan vaksin dipastikan melalui beberapa tahapan uji klinis yang benar dan menjunjung tinggi kaidah ilmu pengetahuan, sains dan standar-standar kesehatan.\n- Pemerintah hanya menyediakan vaksin COVID-19 yang terbukti aman dan lolos uji klinis, serta sudah mendapatkan Izin Penggunaan Pada Masa Darurat (Emergency Use of Authorization/EUA) dari BPOM.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Siapa sasaran penerima Vaksinasi COVID-19?",
              content: "Kelompok prioritas penerima vaksin adalah penduduk yang berdomisili di Indonesia yang berusia ≥ 18 tahun. Kelompok penduduk berusia di bawah 18 tahun dapat diberikan vaksinasi apabila telah tersedia data keamanan vaksin yang memadai dan persetujuan penggunaan pada masa darurat (emergency use authorization) atau penerbitan nomor izin edar (NIE) dari Badan Pengawas Obat dan Makanan.",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Di mana tempat Pelayanan Vaksinasi COVID-19?",
              content:"Pelayanan vaksinasi COVID-19 dilaksanakan di Fasilitas Pelayanan Kesehatan milik Pemerintah Pusat, Pemerintah Daerah Provinsi, Pemerintah Daerah Kabupaten/Kota atau milik masyarakat/swasta yang memenuhi persyaratan, meliputi:\n1. Puskesmas, Puskesmas Pembantu\n2. Klinik\n3. Rumah Sakit dan/ atau\n4. Unit Pelayanan Kesehatan di Kantor Kesehatan Pelabuhan (KKP)\nDinas Kesehatan Kabupaten/Kota dan Puskesmas juga dapat membuat pos pelayanan vaksinasi COVID-19. Dianjurkan agar setiap sasaran mencari informasi terlebih dahulu terkait jadwal layanan masing-masing fasilitas pelayanan kesehatan atau pos pelayanan vaksinasi.\n\n\n\n\n",
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Question Box'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xffffb1b1),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionBox()),
            );
          },
        ),
      );
  }
}

