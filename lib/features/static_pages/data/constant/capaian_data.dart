// Titles for different sections in the capaian page
class SectionTitles {
  static const capaian = 'Capaian Pembelajaran';
  static const elemen = 'Elemen Capaian Pembelajaran';
  static const kompetensi = 'Kompetensi Capaian Pembelajaran';
  static const tujuan = 'Tujuan Pembelajaran';
}

class TextItem {
  final String text;
  const TextItem(this.text);
}

class StepItem {
  final String title;
  final List<String> bullets;

  const StepItem({
    required this.title, 
    required this.bullets
  });
}

class PemahamanItem {
  final String description;
  final List<SubPemahaman> breakdown;

  PemahamanItem({
    required this.description,
    required this.breakdown,
  });
}

class SubPemahaman {
  final String title;
  final String content;

  SubPemahaman({
    required this.title,
    required this.content,
  });
}

const String CapaianPembelajaranData = 
  '''Pada akhir fase E, peserta didik memiliki kemampuan untuk merespon isu-isu global dan berperan aktif dalam memberikan penyelesaian masalah melalui kemampuan mengidentifikasi, mengajukan gagasan, merancang solusi, mengambil keputusan, dan mengomunikasikan dalam bentuk projek sederhana atau simulasi visual. Peserta didik mampu mengamati, menyelidiki, dan menjelaskan fenomena sesuai kaidah kerja ilmiah dalam menjelaskan konsep kimia dalam kehidupan sehari-hari; menuliskan reaksi kimia dan menerapkan hukum-hukum dasar kimia; serta membangun akhlak mulia dan sikap ilmiah seperti jujur, objektif, bernalar kritis, kreatif, mandiri, inovatif, bergotong royong, dan berkebhinekaan global.'''
;


class ElemenCapaianData {
  static final pemahamanKimia = [
    PemahamanItem(
      description:
          "Peserta didik mampu mengamati, menyelidiki dan menjelaskan fenomena sesuai kaidah kerja ilmiah dalam menjelaskan konsep kimia dalam kehidupan sehari-hari; menuliskan reaksi kimia dan menerapkan hukum-hukum dasar kimia.\n\nPenjabaran untuk Konsep Mol:",
      breakdown: [
        SubPemahaman(
          title: "Fakta",
          content: "Menyebutkan nilai bilangan Avogadro dan volume molar STP",
        ),
        SubPemahaman(
          title: "Konsep",
          content: "Menjelaskan pengertian mol sebagai satuan jumlah zat",
        ),
        SubPemahaman(
          title: "Prinsip",
          content: "Menjelaskan hubungan mol dengan jumlah partikel, massa, dan volume",
        ),
        SubPemahaman(
          title: "Prosedur",
          content: "Konversi mol ↔ partikel ↔ massa ↔ volume",
        ),
        SubPemahaman(
          title: "Kontekstual",
          content: "Mengaitkan konsep mol dengan kehidupan sehari-hari",
        ),
      ],
    ),
  ];

  static final keterampilanProses = [
    StepItem(
      title : "Mengamati",
      bullets : [
        "Mengamati perbedaan massa berbagai zat yang jumlah molnya sama",
        "Mengamati label komposisi zat pada produk sehari-hari"
      ]
    ),
    StepItem(
      title : "Mempertanyakan dan Memprediksi",
      bullets : [
        '''Mempertanyakan: "Mengapa 1 mol besi massanya berbeda dengan 1 mol air?"''',
      ]
    ),
    StepItem(
      title : "Merencanakan dan Melakukan Penyelidikan",
      bullets : [
        "Merancang langkah penyelesaian soal konversi mol secara sistematis",
      ]
    ),
    StepItem(
      title : "Memproses, Menganalisis Data dan Informasi",
      bullets : [
        "Mengolah data massa/volume zat menjadi jumlah mol",
        "Menganalisis hubungan antar besaran dalam konsep mol"
      ]
    ),
    StepItem(
      title : "Mengomunikasikan Hasil",
      bullets : [
        "Menyajikan penyelesaian soal konsep mol secara sistematis dan runtut",
        "Menggunakan simbol dan satuan yang benar"
      ]
    ),
  ];
}

const TujuanPembelajaranData = [
  TextItem("Peserta didik kelas X mampu menganalisis hubungan antara jumlah mol dengan jumlah partikel suatu zat menggunakan bilangan Avogadro."),
  TextItem("Peserta didik kelas X mampu menganalisis hubungan antara jumlah mol dengan massa zat berdasarkan konsep Ar dan Mr."),
  TextItem("Peserta didik kelas X mampu menganalisis hubungan antara jumlah mol dengan volume gas pada keadaan STP maupun non-STP serta membangun strategi penyelesaian masalah yang melibatkan konversi mol-volume secara terintegrasi."),
];
