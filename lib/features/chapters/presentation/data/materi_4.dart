// presentation/data/materi_4.dart
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_blocks/bullet_list_block.dart';

class MateriBab4 {
  static const List<MateriBlock> blocks = [
    // Heading utama
    HeadingBlock('4. Volume dan Hubungannya dengan Mol', level: 1),

    // Paragraf pembuka
    ParagraphBlock(
      'Di subbab sebelumnya, kita sudah mengenal bahwa mol dapat menyatakan jumlah partikel dan dihubungkan dengan massa suatu zat. Dengan mengonversi jumlah partikel ke dalam mol, kita bisa menentukan massa zat, ataupun menghitung jumlah atom atau molekul. Konsep mol sebenarnya berlaku untuk semua wujud zat — padat, cair, maupun gas. Namun, untuk zat berwujud gas, mengukur massa secara langsung tidaklah praktis. Maka muncul pertanyaan: bagaimana cara menyatakan jumlah mol suatu gas? Jawabannya adalah melalui volumenya. Di subbab ini, kalian akan belajar menentukan volume 1 mol zat berwujud gas pada kondisi tertentu, yang dikenal sebagai volume molar.',
      indent: 0,
    ),

    // Hukum Avogadro
    ParagraphBlock(
      'Menurut Amedeo Avogadro: pada suhu dan tekanan tertentu, setiap gas yang volumenya sama mengandung jumlah molekul yang sama. Artinya, gas apapun selama volumenya sama dan diukur pada P dan T yang sama akan mengandung jumlah molekul yang sama. Jika jumlah molekul gas sebanyak tetapan Avogadro (L = 6,02 × 10²³ molekul) maka dapat dikatakan jumlah gas tersebut adalah satu mol.',
      indent: 0,
    ),

    ParagraphBlock(
      'Berdasarkan perhitungan yang mengacu pada Hukum Avogadro, pada 0°C dan 1 atm (STP, Standard Temperature and Pressure), volume satu mol gas adalah 22,4 liter. Volume satu mol gas ini dikenal dengan volume molar gas.',
      indent: 0,
    ),

    // Tabel volume gas
    ParagraphBlock(
      'Untuk memastikan pemahaman kalian terkait pembahasan di atas, perhatikan tabel volume gas beberapa zat berikut:',
      indent: 0,
    ),

    TableBlock(
      headers: ['Zat', 'Mol', 'Massa (gram)', 'Volume Molar (L/mol)', 'Volume Gas (L) STP', 'Jumlah partikel'],
      rows: [
        ['NO₂', '1', '46', '22,4 L/mol', '22,4 L', '6,022 × 10²³'],
        ['NH₃', '2', '34', '22,4 L/mol', '44,8 L', '1,2044 × 10²⁴'],
        ['CO', '0,5', '14', '22,4 L/mol', '11,2 L', '3,011 × 10²³'],
      ],
    ),

    // Kesimpulan rumus
    ParagraphBlock(
      'Dari data pada tabel di atas, dapat kita simpulkan bahwa:',
      indent: 0,
    ),

    MathBlock(
      r'V = n \times V_m',
      highlight: true,
    ),

    ParagraphBlock(
      'V = Volume gas (L)',
      indent: 12,
    ),
    ParagraphBlock(
      'n = Jumlah mol (mol)',
      indent: 12,
    ),
    ParagraphBlock(
      'Vm = Volume molar (L/mol)',
      indent: 12,
    ),


    // Contoh soal 1
    ParagraphBlock('Contoh:', indent: 0, isBold: true),

    ParagraphBlock(
      'Sebanyak 22 gram gas CO₂ (Ar: C = 12, O = 16) diukur pada suhu 0°C dan tekanan 1 atm. Tentukan volume gas CO₂ tersebut!',
      indent: 12,
    ),

    ParagraphBlock('Jawab:', indent: 24, isBold: true),

    ParagraphBlock(
      'Massa CO₂ = 22 gram',
      indent: 24,
    ),
    MathBlock(r'\text{Mr CO₂} = 12 + (2 \times 16) = 44'),
    MathBlock(r'\text{Mol CO₂} = \frac{22 \text{ gram}}{44} = 0,5 \text{ mol}'),
    MathBlock(r'\text{Volume CO₂} = 0,5 \text{ mol} \times 22,4 \text{ L/mol} = 11,2 \text{ L}'),


    // Contoh soal 2
    ParagraphBlock(
      'Hitung massa dari 4,48 liter gas C₂H₂ yang diukur pada keadaan standar! (Mr C₂H₂ = 26)',
      indent: 12,
    ),

    ParagraphBlock('Jawab:', indent: 24, isBold: true),

    MathBlock(
      r'\text{Mol C₂H₂} = \frac{\text{Volume gas C₂H₂}}{\text{Volume standar}} = \frac{4,48 \text{ L}}{22,4 \text{ L/mol}} = 0,2 \text{ mol}',
    ),
    MathBlock(r'\text{Massa C₂H₂} = \text{mol} \times \text{Mr C₂H₂} = 0,2 \text{ mol} \times 26 = 5,2 \text{ gram}'),

    // Contoh soal 3
    ParagraphBlock(
      'Hitung volume dari 3,011 × 10²³ molekul NO₂ yang diukur pada suhu 0°C dan tekanan 76 cmHg!',
      indent: 12,
    ),

    ParagraphBlock('Jawab:', indent: 24, isBold: true),

    MathBlock(
      r'\text{Mol NO₂} = \frac{\text{Jumlah partikel NO₂}}{N_A} = \frac{3,011 \times 10^{23}}{6,022 \times 10^{23}} = 0,5 \text{ mol}',
    ),
    MathBlock(r'\text{Volume NO₂} = \text{mol} \times V_m = 0,5 \text{ mol} \times 22,4 \text{ L/mol} = 11,2 \text{ L}'),


    ParagraphBlock( 
      'Berdasarkan penjelasan di atas, hubungan mol dengan jumlah partikel, massa zat, dan volume zat pada keadaan standar adalah:',
      indent: 0,
    ),
    ImageBlock(
      assetPath: 'assets/images/material/materi_4_1.png',
      width: double.infinity,
      caption: '',
    ),

    // Keadaan Tidak Standar
    ParagraphBlock(
      'Perlu diingat bahwa kondisi standar (STP) hanyalah salah satu keadaan yang digunakan sebagai acuan. Dalam kehidupan nyata, gas tidak selalu berada pada kondisi STP. Oleh karena itu, para ilmuwan juga menetapkan kondisi acuan lain yang lebih dekat dengan kondisi sehari-hari, yaitu RTP (Room Temperature and Pressure). Selain itu, untuk gas yang dianggap berperilaku ideal, volume molarnya dapat dihitung menggunakan pendekatan tersendiri. Bahkan, kita juga bisa membandingkan volume dua gas berbeda tanpa perlu mengetahui kondisi tekanan dan suhunya secara spesifik — cukup dengan perbandingan molnya saja. Berikut akan dibahas satu per satu kondisi-kondisi tersebut.',
      indent: 0,
    ),

    // A. Keadaan Tidak Standar (Suhu Kamar)
    HeadingBlock('A. Keadaan Tidak Standar (Suhu Kamar)', level: 2),

    ParagraphBlock(
      'Selain STP, terdapat kondisi acuan lain yang disebut RTP (Room Temperature and Pressure), yaitu kondisi pada suhu ruang 25°C (298 K) dan tekanan 1 atm. Kondisi ini dianggap lebih mewakili keadaan sehari-hari dibandingkan STP.',
      indent: 0,
    ),

    // B. Gas Ideal
    HeadingBlock('B. Gas Ideal', level: 2),

    ParagraphBlock(
      'Dalam perhitungan kimia, seringkali gas diasumsikan bersifat ideal. Gas ideal adalah gas yang dianggap memenuhi beberapa asumsi penyederhanaan, yaitu:',
      indent: 0,
    ),

    BulletListBlock(
      [
        'partikel-partikelnya tidak memiliki volume sendiri',
        'tidak ada gaya tarik-menarik antar partikelnya',
        'setiap tumbukan antar partikel bersifat elastis sempurna',
      ],
      indent: 15,
    ),

    ParagraphBlock(
      'Gas ideal tidak benar-benar ada di alam, namun gas nyata seperti H₂, O₂, dan N₂ pada suhu tinggi dan tekanan rendah berperilaku mendekati ideal, sehingga asumsi ini cukup valid digunakan dalam perhitungan.',
      indent: 0,
    ),

    ParagraphBlock(
      'Untuk menentukan volume gas pada kondisi tertentu, digunakan persamaan gas ideal:',
      indent: 0,
    ),

    MathBlock(
      r'PV = nRT',
      highlight: true,
    ),

    ParagraphBlock(
      'P = Tekanan (atm)',
      indent: 12,
    ),
    ParagraphBlock(
      'V = Volume gas (liter)',
      indent: 12,
    ),
    ParagraphBlock(
      'n = Jumlah mol (mol)',
      indent: 12,
    ),
    ParagraphBlock(
      'R = Tetapan gas ideal (0,082 L atm/mol K)',
      indent: 12,
    ),
    ParagraphBlock(
      'T = 0 °C = 298 K',
      indent: 12,
    ),


    // Pertanyaan penutup
    ParagraphBlock(
      'Persamaan ini sebenarnya berlaku untuk semua kondisi, termasuk STP dan RTP. Bedanya, pada STP dan RTP kondisi suhu dan tekanannya sudah ditetapkan, sehingga nilai volume molarnya bisa dihitung lebih dulu dan langsung digunakan tanpa harus memasukkan semua variabel setiap kali menghitung. Sedangkan untuk kondisi suhu dan tekanan lainnya, kita tetap menggunakan PV = nRT secara langsung dengan memasukkan nilai P, T, dan n yang diketahui.',
    ),

    ParagraphBlock(
      'Contoh:',
      isBold: true,
    ),

    ParagraphBlock(
      'Berapa volume gas H₂ yang terdapat dalam balon pada 27°C jika tekanan H₂ sebesar 2 atm dan beratnya 0,5 g? Diketahui: R = 0,082 L atm/mol K dan Ar H = 1'
    ),

    ParagraphBlock('Jawab:', isBold: true),

    MathBlock(
      r'\text{Mol H₂} = \frac{\text{massa}}{\text{Mr}} = \frac{0,5 \text{ gram}}{2} = 0,25 \text{ mol}',
    ),
    ParagraphBlock(''),

    MathBlock(
      r'\text{V H₂} = \frac{nRT}{P} = \frac{0,25 \text{ mol} \times 0,082 \text{ L} \cdot \text{atm/mol} \cdot \text{K} \times (273 + 27) \text{ K}}{2 \text{ atm}}',
    ),

    ParagraphBlock(''),
    MathBlock(
      r'V = 3,075 \text{ L}',
    ),
  ];
}