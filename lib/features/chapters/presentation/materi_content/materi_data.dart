import 'package:flutter/material.dart';
import 'content_blocks.dart';

class MateriData {
  static List<MateriBlock> materi1() {
    return const [
      HeadingBlock('1. Definisi Awal dari “Mol” (Membangun Pemahaman)', level: 1),

      ParagraphBlock(
        'Pada bab struktur atom, kalian telah mempelajari nomor massa dan nomor atom. Satuan massa atom memberikan skala relatif untuk nilai massa suatu unsur. Tetapi, karena atom memiliki massa yang sangat kecil, tidak mungkin bagi kalian untuk menghitung atau menimbang unsur-unsur tersebut dalam satuan massa atom yang terkalibrasi. Dalam situasi nyata, khususnya di laboratorium, kita berurusan dengan sampel makroskopik yang mengandung jumlah atom yang sangat besar.',
        indent: 0,
      ),

      ParagraphBlock(
        'Pernahkah kalian berpikir: '
        'Bagaimana para ilmuwan menghitung atom yang jumlahnya sangat banyak? Seperti kalian menyebut 2 orang sejoli sebagai 1 pasangan, 12 buku sebagai 1 lusin, dan 144 item sebagai 1 gross. Para kimiawan juga mengukur atom dan molekul dalam satuan mol.',
        indent: 0,
        highlight: true,
      ),

      ParagraphBlock(
        'Dalam Sistem Satuan Internasional (SI), mol adalah jumlah zat yang mengandung tepat '
        '\$6{,}022\\times 10^{23}\$ partikel (baik unsur, molekul, atau ion). '
        'Jumlah ini disebut Bilangan Avogadro (\$N_A\$).'
        'sebagai penghormatan kepada ilmuwan Italia Amedeo Avogadro atas kontribusinya dalam bidang kimia. Jadi, jika kita memakai contoh di atas, maka dapat kita simpulkan bahwa 1 mol adalah \$6{,}022\\times 10^{23}\$ partikel.',
        indent: 0,
      ),

      MathBlock(r'N_A = 6{,}022\times 10^{23}', highlight: true),

      ImageBlock(
        assetPath: 'assets/images/materi1_avogadro.png',
        width: 220,
        caption: 'Ilustrasi 1 mol = 6,022 × 10²³ partikel',
      ),

      ParagraphBlock(
        'Bagaimana cara menyatakan jumlah partikel yang terkandung dalam unsur, molekul, atau ion?',
        indent: 0,
      ),

      BulletListBlock(
        [
          '1 mol unsur X memiliki \$6{,}022\\times 10^{23}\$ partikel unsur X',
          '1 mol molekul XY memiliki \$6{,}022\\times 10^{23}\$ partikel molekul XY',
          '1 mol ion X⁺ memiliki \$6{,}022\\times 10^{23}\$ partikel ion X⁺',
        ],
        indent: 15,
      ),

      ParagraphBlock(
        'Bagaimana jika ingin menyatakan jumlah partikel dalam 0,5 mol, 2 mol, dan seterusnya?',
        indent: 0,
      ),

      BulletListBlock(
        [
          '0,5 mol unsur X memiliki \$0{,}5 \\times 6{,}022\\times 10^{23}\$ partikel atau \$3{,}011\\times 10^{23}\$ partikel unsur Y',
          '2 mol ion Z+ memiliki \$2 \\times 6{,}022\\times 10^{23}\$ partikel, atau \$12{,}044\\times 10^{23}\$ partikel ion \$Z^{+}\$',
        ],
        indent: 15,
      ),

      ParagraphBlock(
        'Kesimpulan:',
        indent: 24,
        isBold: true,
      ),

      MathBlock(
        r'\begin{aligned}'
        r'\text{Jumlah partikel }(X) &= n \times 6{,}022 \times 10^{23} \\'
        r'n &= \frac{x}{6{,}022 \times 10^{23}}'
        r'\end{aligned}',
        highlight: true,
      ),

      ParagraphBlock('Contoh:', indent: 24, isBold: true),

      ParagraphBlock(
        'Suatu sampel mengandung \$1{,}505\\times 10^{23}\$ partikel Cl₂. Berapa kandungan mol Cl₂?',
        indent: 24,
      ),

      MathBlock(
        r'n=\frac{1{,}505\times 10^{23}}{6{,}022\times 10^{23}}=0{,}25\ \text{mol}'
        ),

      const ParagraphBlock(
        'Suatu sampel mengandung 1,505 × 10²³ partikel Cl₂, maka berapa kandungan mol dalam Cl₂ tersebut?',
        indent: 12,
      ),

      const ParagraphBlock(
        'Jawab:',
        isBold: true,
        indent: 12,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'n &= \frac{X}{6{,}022 \times 10^{23}} \\'
        r'  &= \frac{1{,}505 \times 10^{23}}{6{,}022 \times 10^{23}} \\'
        r'  &= 0{,}25 \text{ mol}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Soal 2 =====
      const ParagraphBlock(
        'Suatu sampel logam mengandung 5 mol emas murni (Au).',
        indent: 12,
      ),

      const ParagraphBlock(
        'a. Apakah jenis partikel unsur emas?',
        indent: 24,
      ),

      const ParagraphBlock(
        'Jawab: Emas adalah unsur logam, sehingga jenis partikelnya adalah atom emas.',
        indent: 36,
      ),

      const ParagraphBlock(
        'b. Berapakah jumlah partikel dalam sampel tersebut?',
        indent: 24,
      ),

      const ParagraphBlock(
        'Jawab:',
        indent: 36,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'X &= n \times 6{,}022 \times 10^{23} \\'
        r'  &= 5 \times 6{,}022 \times 10^{23} \\'
        r'  &= 3{,}01 \times 10^{24} \text{ partikel atom emas}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Soal 3 =====
      const ParagraphBlock(
        'Dalam 3 mol C₂H₅OH (etanol), berapa banyak atom C, H, dan O yang terkandung di dalamnya secara berurutan?',
        indent: 12,
      ),

      const ParagraphBlock(
        'Jawab:',
        isBold: true,
        indent: 12,
      ),

      const ParagraphBlock(
        '1 molekul etanol mengandung 2 atom C, 6 atom H, dan 1 atom O.',
        indent: 24,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mol C} &= 3 \times 2 = 6 \text{ mol} \\'
        r'\text{Mol H} &= 3 \times 6 = 18 \text{ mol} \\'
        r'\text{Mol O} &= 3 \times 1 = 3 \text{ mol}'
        r'\end{aligned}',
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Atom C} &= 6 \times 6{,}022 \times 10^{23}'
        r'= 3{,}613 \times 10^{24} \\'
        r'\text{Atom H} &= 18 \times 6{,}022 \times 10^{23}'
        r'= 1{,}084 \times 10^{25} \\'
        r'\text{Atom O} &= 3 \times 6{,}022 \times 10^{23}'
        r'= 1{,}807 \times 10^{24}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Paragraf Transisi =====
      const ParagraphBlock(
        'Untuk memastikan pemahaman kalian, perhatikan tabel perbandingan 1 mol dari berbagai unsur berikut:',
      ),

      // ===== Table =====
      const TableBlock(
        headers: ['Element', 'Number of Atoms Present', 'Mass of Sample (g)'],
        rows: [
          ['Aluminum', '6.022 × 10²³', '26.98'],
          ['Copper', '6.022 × 10²³', '63.55'],
          ['Iron', '6.022 × 10²³', '55.85'],
          ['Sulfur', '6.022 × 10²³', '32.07'],
          ['Iodine', '6.022 × 10²³', '126.9'],
          ['Mercury', '6.022 × 10²³', '200.6'],
        ],
      ),

      // ===== Penjelasan =====
      const ParagraphBlock(
        'Setiap sampel unsur yang mengandung 6,022 × 10²³ atom (1 mol) memiliki massa yang berbeda-beda sesuai dengan massa atom relatif (Ar) masing-masing unsur.',
      ),

      const ParagraphBlock(
        'Dengan kata lain, 1 mol unsur selalu mengandung jumlah partikel yang sama, tetapi massanya bergantung pada jenis unsurnya.',
        highlight: true,
      ),

      // ===== Pertanyaan Reflektif =====
      const ParagraphBlock(
        'Pertanyaan berikutnya: Jika 1 mol berbagai unsur mengandung jumlah partikel yang sama, mengapa massanya berbeda? Mari kita pelajari tentang Ar dan Mr!',
        isBold: true,
      ),

      // ===== Tahukah Kamu =====
      const ParagraphBlock(
          '💡 TAHUKAH KAMU?\n'
          'Perhitungan mol memastikan dosis yang aman dan efektif. '
          'Ketika dokter meresepkan obat paracetamol 500 mg, dosis ini '
          'sebenarnya dihitung berdasarkan konsep mol! Inilah mengapa '
          'konsep mol sangat penting dalam dunia farmasi.',
        highlight: true,
      ),

    ];
  }

  static List<MateriBlock> materi2() {
    return const [
      HeadingBlock('2. Ar dan Mr (Massa Atom dan Massa Molekul Relatif)', level: 1),
      const ParagraphBlock(
        
            'Kalian telah mempelajari pengertian mol pada sub bab sebelumnya. '
            'Berdasarkan data pada tabel, diketahui bahwa dalam 26,98 g aluminium '
            'terdapat 6,022 × 10²³ partikel unsur Al, dalam 32,07 g sulfur terdapat '
            '6,022 × 10²³ partikel unsur S, dan sebagainya.',
      ),

      const ParagraphBlock(
        
            'Berdasarkan informasi tersebut, terlihat adanya hubungan yang teratur '
            'antara massa zat (g) dan jumlah partikel (L). Sebelum membahas hubungan '
            'mol dengan massa, terlebih dahulu akan diperkenalkan Massa Atom Relatif '
            'dan Massa Molekul Relatif.',
        highlight: true,
      ),

      // ===== Massa molar & sma =====
      const ParagraphBlock(
        
            'Massa 1 mol zat sering disebut dengan massa molar. Besarnya massa molar '
            'zat adalah massa atom relatif (Ar) atau massa molekul relatif (Mr) zat '
            'yang dinyatakan dalam satuan gram per mol.',
      ),

      const ParagraphBlock(
        
            'Untuk bisa membandingkan “seberapa berat” suatu atom terhadap atom lain, '
            'para ilmuwan membuat skala pembanding yang disebut satuan massa atom (sma). '
            'Sebagai titik acuan, dipilih satu isotop karbon yang sangat stabil, yaitu '
            'karbon-12 (C-12). Oleh karena itu, IUPAC telah menetapkan:',
      ),

      // ===== Definisi sma =====
      const MathBlock(
        r'1\ \text{sma} = \frac{1}{12}\ \text{massa satu atom C-12 isotop}',
        highlight: true,
      ),

      const MathBlock(
        r'\text{Massa 1 atom karbon} = 12\ \text{sma}',
      ),

      // ===== Ar =====
      const ParagraphBlock(
         'a. Massa Atom Relatif (Ar)',
        isBold: true,
      ),

      const ParagraphBlock(
        
            'Massa Atom Relatif (Ar) adalah perbandingan massa rata-rata suatu atom '
            'unsur terhadap 1/12 massa satu atom C-12 isotop. Dengan pengertian tersebut, '
            'didapatkan rumus:',
      ),

      const MathBlock(
        r'\text{Ar X} = '
        r'\frac{\text{massa rata-rata 1 atom unsur X}}'
        r'{\frac{1}{12}\ \text{massa 1 atom isotop C-12}}',
        highlight: true,
      ),

      const MathBlock(
        r'\text{Ar X} = \text{massa rata-rata 1 atom unsur X}',
        highlight: true,
      ),

      const ParagraphBlock(
        'Nilai Ar menunjukkan massa satu mol atom unsur jika dinyatakan dalam gram. '
        'Artinya, jika kita punya 1 mol atom unsur, massanya sama dengan angka Ar-nya '
        'dalam gram.',
      ),

      const ParagraphBlock(
         'Contoh:',
        isBold: true,
      ),

      const TableBlock(
        headers: ['Nama Zat', 'Rumus', 'Massa Zat', 'Massa Molar (Ar)'],
        rows: [
          ['Besi', 'Fe', '56 g', '56 g/mol'],
          ['Karbon', 'C', '12 g', '12 g/mol'],
          ['Oksigen', 'O', '16 g', '16 g/mol'],
        ],
      ),

      const ParagraphBlock(
        'Massa suatu zat merupakan perkalian massa molarnya (g/mol) dengan mol zat '
        'tersebut (n).',
      ),

      const MathBlock(
        r'\text{Massa zat} = \text{Massa molar (Ar)} \times \text{mol}',
        highlight: true,
      ),

      const ParagraphBlock(
         'Contoh:',
        isBold: true,
      ),

      const ParagraphBlock(
          '- Massa molar besi (Fe) = massa dari 1 mol besi (Fe) = Ar Fe = 56 gram/mol\n'
          '- Massa molar karbon (C) = massa dari 1 mol karbon (C) = Ar C = 12 gram/mol',
        indent: 12,
      ),

      // ===== Isotop =====
      const ParagraphBlock(
        
            'Di dalam umumnya unsur terdiri atas campuran isotop, sehingga massa atomnya '
            'diambil rata-rata dari campuran isotopnya.',
        highlight: true,
      ),

      const ParagraphBlock(
        'Contoh: Di alam terdapat campuran ³⁵Cl dan ³⁷Cl dengan perbandingan 75% dan 25%. '
        'Cara menghitung Ar-nya adalah:',
      ),

      const MathBlock(
        r'\text{Ar Cl} = (75\% \times 35) + (25\% \times 37) = 35{,}5',
        highlight: true,
      ),

      // ===== Mr =====
      const ParagraphBlock(
         'b. Massa Molekul Relatif (Mr)',
        isBold: true,
      ),

      const ParagraphBlock(
        'Massa molekul relatif (Mr) adalah perbandingan massa rata-rata satu molekul '
        'suatu senyawa terhadap 1/12 massa satu atom C-12 isotop.',
      ),

      const ParagraphBlock(
        'Karena molekul terdiri dari beberapa atom, maka Mr merupakan jumlah Ar '
        'atom-atom penyusunnya. Sehingga, rumus untuk mencari Mr adalah:',
      ),

      const MathBlock(
        r'\text{Mr} = \Sigma \text{Ar}',
        highlight: true,
      ),

      const ParagraphBlock(
        'Setiap zat punya massa tertentu untuk setiap 1 mol-nya. Besarnya sama '
        'dengan nilai Mr dalam gram.',
      ),

      // ===== Tabel Mr =====
      const ParagraphBlock(
         'Contoh:',
        isBold: true,
      ),

      const TableBlock(
        headers: ['Nama Zat', 'Rumus', 'Massa Zat', 'Massa Molar (Mr)'],
        rows: [
          ['Garam Dapur', 'NaCl', '58,5 g', '58,5 g/mol'],
          ['Air', 'H₂O', '18 g', '18 g/mol'],
          ['Oksigen', 'O₂', '32 g', '32 g/mol'],
        ],
      ),

      // ===== Note penting =====
      const ParagraphBlock(
         'NOTE PENTING:',
        isBold: true,
      ),

      const ParagraphBlock(
          '1. Senyawa diatomik (O₂, H₂, N₂, dan lainnya) tidak dihitung sebagai Ar tetapi sebagai Mr\n'
          '2. Jika ada koefisien (contoh 2H₂O), maka koefisien tidak memengaruhi Mr\n'
          '3. Jika ada indeks (contoh MgCl₂), indeks menyatakan jumlah atom\n'
          '4. Jika ada senyawa hidrat (contoh CuSO₄·5H₂O), maka Mr H₂O dikalikan 5',
        highlight: true,
      ),

      // ===== Rumus akhir =====
      const MathBlock(
        r'\text{Massa zat} = \text{Massa molar (Mr)} \times \text{mol}',
        highlight: true,
      ),

      // ===== Contoh Mr =====
      const ParagraphBlock(
         'Contoh:',
        isBold: true,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr H}_2 &= 2 \times \text{Ar H} \\'
        r'&= 2 \times 1 = 2\ \text{gram/mol}'
        r'\end{aligned}',
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr CO}_2 &= \text{Ar C} + (2 \times \text{Ar O}) \\'
        r'&= 12 + (2 \times 16) = 44\ \text{gram/mol}'
        r'\end{aligned}',
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr H}_2\text{SO}_4 &= (2 \times \text{Ar H}) + \text{Ar S} + (4 \times \text{Ar O}) \\'
        r'&= (2 \times 1) + 32 + (4 \times 16) = 98\ \text{gram/mol}'
        r'\end{aligned}',
      ),

      // ===== Refleksi =====
      const ParagraphBlock(
          'Pertanyaan berikutnya: Bagaimana jika kita punya 2,5 mol Fe? '
          'Atau 0,3 mol H₂O? Bagaimana cara menghitung massanya?',
        isBold: true,
        highlight: true,
      ),

      // ===== Tahukah Kamu =====
      const ParagraphBlock(
          '🏭 TAHUKAH KAMU?\n'
          'Pabrik pupuk menggunakan konsep Mr setiap hari untuk menghitung '
          'berapa ton bahan baku yang dibutuhkan untuk menghasilkan pupuk urea '
          '[(NH₂)₂CO]. Perhitungan ini krusial untuk efisiensi produksi. '
          'Kesalahan 1% saja bisa berarti kerugian ratusan juta rupiah. '
          'Inilah mengapa konsep mol dan Mr sangat penting dalam industri kimia!',
        highlight: true,
      ),
    ];   
  } 
  static List<MateriBlock> materi3() {
    return const [
      HeadingBlock('3. Hubungan Mol ↔ Massa Molar', level: 1),

      const ParagraphBlock(
        'Dengan memahami sebelumnya, kalian telah mengetahui bahwa massa molar '
        'zat sama dengan Ar atau Mr zat dan dinyatakan dalam satuan gram. '
        'Bagaimana hubungan mol dengan massa? Mudah sekali, cek rumus di bawah!',
      ),

      // ===== Rumus utama =====
      const MathBlock(
        r'\text{massa zat} = n \times \text{massa molar}',
        highlight: true,
      ),

      const MathBlock(
        r'\text{atau}\ \text{massa zat} = n \times \text{Ar/Mr}',
      ),

      const MathBlock(
        r'n = \frac{\text{massa}}{\text{Ar}}'
        r'\text{ atau } '
        r' n = \frac{\text{massa}}{\text{Mr}}',
        highlight: true,
      ),

      // ===== Contoh 1 =====
      const ParagraphBlock(
         'Contoh:',
        isBold: true,
      ),

      const ParagraphBlock(
         'Hitunglah massa dari:',
        indent: 12,
      ),

      const ParagraphBlock(
        
            'a. 0,75 mol urea CO(NH₂)₂ '
            '(Ar C = 12, O = 16, N = 14, dan H = 1)',
        indent: 24,
      ),

      const ParagraphBlock(
         'Jawab:',
        indent: 36,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Massa urea} &= n \times \text{Mr CO(NH}_2\text{)}_2 \\'
        r'&= 0{,}75 \times 60 \\'
        r'&= 45\ \text{gram}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 2 =====
      const ParagraphBlock(
         'b. 0,5 mol O₂ (Ar O = 16)',
        indent: 24,
      ),

      const ParagraphBlock(
         'Jawab:',
        indent: 36,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Massa O}_2 &= n \times \text{Mr O}_2 \\'
        r'&= 0{,}5 \times 32 \\'
        r'&= 16\ \text{gram}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh Mol dari Massa =====
      const ParagraphBlock(
         'Hitunglah banyaknya mol dari:',
        indent: 12,
      ),

      const ParagraphBlock(
         'a. 2,3 gram natrium (Ar Na = 23)',
        indent: 24,
      ),

      const ParagraphBlock(
         'Jawab:',
        indent: 36,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{mol Na} &= \frac{\text{massa}}{\text{Ar}} \\'
        r'&= \frac{2{,}3}{23} \\'
        r'&= 0{,}1\ \text{mol}'
        r'\end{aligned}',
        highlight: true,
      ),

      const ParagraphBlock(
         'b. 45 gram C₆H₁₂O₆ (Ar C = 12, H = 1, dan O = 16)',
        indent: 24,
      ),

      const ParagraphBlock(
         'Jawab:',
        indent: 36,
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{mol C}_6\text{H}_{12}\text{O}_6 &= \frac{\text{massa}}{\text{Mr}} \\'
        r'&= \frac{45}{180} \\'
        r'&= 0{,}25\ \text{mol}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Ringkasan =====
      const ParagraphBlock(
        
            'Berdasarkan penjelasan mengenai mol, jumlah partikel, massa zat, dan massa '
            'molar (Ar/Mr), dapat kita simpulkan bahwa ketiganya memiliki keterkaitan '
            'yang digambarkan sebagai berikut:',
        highlight: true,
      ),

      // ===== Diagram =====
      const ImageBlock(
        assetPath: 'assets/images/mol-mass-particles.png',
        width: 320,
        border: true,
        caption: 'Hubungan massa, mol, dan jumlah partikel',
      ),

      // ===== Pertanyaan lanjut =====
      const ParagraphBlock(
        
            '❓ Pertanyaan berikutnya: Sampai sekarang, kita belajar tentang zat padat '
            '(seperti besi dan garam) dan cair (seperti air) yang perhitungannya '
            'menggunakan massa (gram). Tapi bagaimana dengan gas?',
        highlight: true,
      ),

      // ===== Tahukah Kamu =====
      const ParagraphBlock(
        
            '⚠️ TAHUKAH KAMU?\n'
            'Salah dosis obat bisa berakibat fatal! Konsep mol menyelamatkan nyawa '
            'setiap hari. Kesalahan 0,1 mg saja bisa berarti perbedaan antara:\n'
            '✅ Obat yang menyembuhkan atau ❌ Racun yang membunuh.\n'
            'Inilah mengapa farmasis adalah salah satu profesi paling presisi di dunia.',
        highlight: true,
      ),
    ];   
  } 
  static List<MateriBlock> materi4() {
    return const [
      HeadingBlock('4. Volume dan Hubungannya dengan Mol', level: 1),
      const ParagraphBlock(
        'Di sub bab sebelumnya, kita sudah tahu bahwa mol bisa menunjukkan berapa '
        'banyak partikel dan bisa diubah menjadi massa dalam gram. Sekarang muncul '
        'pertanyaan baru: Bagaimana kalau zatnya bukan padat atau cair, melainkan gas?',
      ),

      const ParagraphBlock(
        'Di sub bab ini, kalian akan belajar menentukan volume satu mol zat berwujud '
        'gas, yang disebut dengan volume molar.',
      ),

      const ParagraphBlock(
        'Hipotesis Avogadro menyebutkan bahwa pada suhu dan tekanan yang sama, semua '
        'gas dengan volume yang sama akan mengandung jumlah partikel yang sama pula.',
        highlight: true,
      ),

      const ParagraphBlock(
        'Oleh karena itu, setiap 1 mol gas mempunyai jumlah molekul dan volume yang '
        'sama.',
      ),

      const ParagraphBlock(
        'Jadi, 1 mol gas apa pun (misalnya oksigen, hidrogen, nitrogen, atau karbon '
        'dioksida) akan memiliki volume yang sama, yaitu 22,4 liter.',
        isBold: true,
      ),

      // ===== Ilustrasi balon =====
      const ImageBlock(
        assetPath: 'assets/images/volume-gas-balon.png',
        width: 300,
        border: true,
        caption: 'Semua gas 1 mol memiliki volume yang sama (22,4 L)',
      ),

      const ParagraphBlock(
        'Artinya, 22,4 liter ini bukan angka sembarangan, tetapi hasil dari eksperimen '
        'yang dilakukan Avogadro dan merupakan volume standar untuk setiap 1 mol gas.',
        highlight: true,
      ),

      const ParagraphBlock(
        'Kalian bisa membayangkan tiga balon gas berukuran sama, di mana satu berisi '
        'oksigen, satu berisi hidrogen, dan satu berisi karbon dioksida. Meskipun '
        'isinya berbeda, jika ketiganya berisi 1 mol gas, maka ketiganya memiliki '
        'volume yang sama: 22,4 liter.',
      ),

      const ParagraphBlock(
        'Berdasarkan hukum tersebut berlaku volume 1 mol setiap gas dalam keadaan '
        'standar (suhu 0°C dan tekanan 1 atm) sebagai berikut:',
      ),

      const MathBlock(
        r'\text{Volume gas dalam keadaan standar} = 22{,}4\ \text{L/mol}',
        highlight: true,
      ),

      const ParagraphBlock(
        'Karena volume gas dipengaruhi oleh suhu dan tekanan, maka untuk menghitung '
        'volume gas kita perlu mengetahui terlebih dahulu nilai suhu dan tekanan gas '
        'tersebut.',
      ),

      // ===== STP =====
      const ParagraphBlock(
        '1. Keadaan Standar (STP)',
        isBold: true,
      ),

      const ParagraphBlock(
        'Kondisi di mana suhu 0°C dan tekanan 1 atm (76 cmHg atau 760 mmHg) disebut '
        'dengan keadaan standar (Standard Temperature and Pressure atau STP).',
      ),

      const ParagraphBlock(
        'Jadi, pada keadaan standar (STP), volume molar (volume 1 mol gas) adalah '
        '22,4 L/mol.',
        highlight: true,
      ),

      const ParagraphBlock(
        'Untuk memastikan pemahaman kalian, perhatikan tabel volume gas beberapa zat '
        'berikut:',
      ),

      // ===== Table STP =====
      const TableBlock(
        headers: [
          'Zat',
          'Massa (g)',
          'Mol',
          'Volume Molar (L/mol)',
          'Volume Gas (L)',
          'Jumlah Partikel'
        ],
        rows: [
          ['NO₂', '46', '1', '22,4', '22,4', '6,022 × 10²³'],
          ['NH₃', '34', '2', '22,4', '44,8', '1,2044 × 10²⁴'],
          ['CO', '14', '0,5', '22,4', '11,2', '3,011 × 10²³'],
        ],
      ),

      // ===== Rumus =====
      const ParagraphBlock(
        'Dari data pada tabel di atas, dapat kita simpulkan bahwa:',
      ),

      const MathBlock(
        r'V = n \times V_m',
        highlight: true,
      ),

      const ParagraphBlock('V = Volume gas (L)'),
      const ParagraphBlock('n = Jumlah mol (mol)'),
      const ParagraphBlock('Vₘ = Volume molar (L/mol)'),

      // ===== Contoh 1 =====
      const ParagraphBlock('Contoh:', isBold: true),

      const ParagraphBlock(
        'Berapa volume gas CO₂ yang massanya 22 g (Ar: C = 12, O = 16) jika diukur '
        'pada tekanan 1 atm?',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr CO}_2 &= 12 + (2 \times 16) = 44 \\'
        r'\text{mol CO}_2 &= \frac{22}{44} = 0{,}5 \\'
        r'V &= 0{,}5 \times 22{,}4 = 11{,}2\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 2 =====
      const ParagraphBlock(
        'Hitung massa dari 4,48 liter gas C₂H₂ yang diukur pada keadaan standar '
        '(Mr C₂H₂ = 26)!',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{mol C}_2\text{H}_2 &= \frac{4{,}48}{22{,}4} = 0{,}2 \\'
        r'\text{massa} &= 0{,}2 \times 26 = 5{,}2\ \text{gram}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 3 =====
      const ParagraphBlock(
        'Hitung volume dari 3,011 × 10²³ molekul NO₂ yang diukur pada suhu 0°C dan '
        'tekanan 76 cmHg!',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{mol NO}_2 &= \frac{3{,}011 \times 10^{23}}{6{,}022 \times 10^{23}} '
        r'= 0{,}5 \\'
        r'V &= 0{,}5 \times 22{,}4 = 11{,}2\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Diagram Mole Bridge =====
      const ImageBlock(
        assetPath: 'assets/images/mole-bridge-diagram.png',
        width: 300,
        border: true,
        caption: 'Hubungan mol, massa, jumlah partikel, dan volume gas (STP)',
      ),

      // ===== RTP =====
      const ParagraphBlock(
        '2. Keadaan Tidak Standar (Keadaan Kamar)',
        isBold: true,
      ),

      const ParagraphBlock(
        'Untuk menentukan volume suatu gas pada keadaan tidak standar, perhitungan '
        'dapat dilakukan menggunakan persamaan gas ideal.',
      ),

      const ParagraphBlock(
        'Kondisi pengukuran gas pada suhu 25°C dan tekanan 1 atm disebut keadaan '
        'kamar dan dinyatakan dengan RTP (Room Temperature and Pressure).',
      ),

      const MathBlock(
        r'PV = nRT',
        highlight: true,
      ),

      const ParagraphBlock('P = tekanan (atm)'),
      const ParagraphBlock('V = volume gas (liter)'),
      const ParagraphBlock('n = jumlah mol (mol)'),
      const ParagraphBlock('R = tetapan gas = 0,082 L·atm/mol·K'),
      const ParagraphBlock('T = suhu (K)'),

      const ParagraphBlock(
        'Beberapa kondisi gas berada pada keadaan tidak standar antara lain:',
      ),

      const ParagraphBlock(
        '1. Suhu 25°C dan tekanan 1 atm\n'
        '2. Suhu 0°C, tetapi tekanannya bukan 1 atm\n'
        '3. Tekanan 1 atm, tetapi suhunya bukan 0°C\n'
        '4. Tekanan dan suhu bukan dalam keadaan standar',
        highlight: true,
      ),

      // ===== Contoh RTP =====
      const ParagraphBlock(
        'Berapa volume gas H₂ dalam balon pada suhu 27°C jika tekanan H₂ sebesar '
        '2 atm dan massanya 0,5 g? (R = 0,082 L·atm/mol·K, Ar H = 1)',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{mol H}_2 &= \frac{0{,}5}{2} = 0{,}25 \\'
        r'V &= \frac{nRT}{P} = \frac{0{,}25 \times 0{,}082 \times (273+27)}{2} '
        r'= 3{,}075\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Refleksi =====
      const ParagraphBlock(
        '❓ Pertanyaan berikutnya: Kita sudah tahu 1 mol O₂ = 22,4 L (STP). Tapi '
        'bagaimana jika ada reaksi kimia yang melibatkan gas? Apakah volume gas '
        'dalam reaksi kimia juga punya pola tertentu?',
        highlight: true,
      ),

      // ===== Tahukah Kamu =====
      const ParagraphBlock(
        '🧠 TAHUKAH KAMU?\n'
        'Penyelam laut dalam mengalami efek “nitrogen narcosis” atau “mabuk nitrogen”. '
        'Solusinya, penyelam profesional menggunakan campuran gas khusus (Heliox: '
        'Helium + Oksigen). Perhitungan mol dan volume gas pada berbagai kedalaman '
        'dapat menyelamatkan nyawa penyelam!',
        highlight: true,
      ),
    ];   
  } 
  static List<MateriBlock> materi5() {
    return const [
      HeadingBlock('5. Perbandingan Volume (Reaksi Gas)', level: 1),

      // ===== Pengantar =====
      const ParagraphBlock(
        'Menurut hukum Avogadro, perbandingan gas-gas yang jumlah molnya sama '
        'memiliki volume yang sama. Pada suhu dan tekanan yang sama, volume gas '
        'hanya bergantung pada jumlah molnya.',
      ),

      const ParagraphBlock(
        'Artinya, perbandingan mol akan menyatakan perbandingan volume. Misalkan '
        'gas pertama dengan jumlah mol n₁ dan volume V₁ serta gas kedua dengan '
        'jumlah mol n₂ dan volume V₂. Pada suhu dan tekanan yang sama dapat '
        'dinyatakan sebagai berikut:',
      ),

      // ===== Rumus utama =====
      const MathBlock(
        r'\frac{V_1}{V_2} = \frac{n_1}{n_2}'
        r'\quad \text{atau} \quad'
        r'\frac{n_1}{V_1} = \frac{n_2}{V_2}',
        highlight: true,
      ),

      const ParagraphBlock(
        'V₁ dan n₁ adalah volume dan mol milik gas 1',
      ),
      const ParagraphBlock(
        'V₂ dan n₂ adalah volume dan mol milik gas 2',
      ),

      // ===== Contoh 1 =====
      const ParagraphBlock('Contoh:', isBold: true),

      const ParagraphBlock(
        'Tentukan volume dari 2 mol gas nitrogen jika diukur pada suhu dan tekanan '
        'yang sama di mana 0,5 mol gas oksigen mempunyai volume 15 liter.',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\frac{V_{O_2}}{V_{N_2}} &= \frac{n_{O_2}}{n_{N_2}} \\'
        r'V_{N_2} &= \frac{n_{N_2}}{n_{O_2}} \times V_{O_2} \\'
        r'&= \frac{2}{0{,}5} \times 15 = 60\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 2 =====
      const ParagraphBlock(
        'Berapa volume 4 g gas metana (CH₄) yang diukur pada keadaan yang sama '
        'dengan 3 g NO volumenya 5 L? (Ar: H = 1, C = 12, N = 14, O = 16)',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr CH}_4 &= 16 \Rightarrow n_{CH_4} = \frac{4}{16} = 0{,}25 \\'
        r'\text{Mr NO} &= 30 \Rightarrow n_{NO} = \frac{3}{30} = 0{,}1'
        r'\end{aligned}',
      ),

      const MathBlock(
        r'\begin{aligned}'
        r'\frac{V_{CH_4}}{V_{NO}} &= \frac{n_{CH_4}}{n_{NO}} \\'
        r'V_{CH_4} &= \frac{0{,}25}{0{,}1} \times 5 = 12{,}5\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 3 Reaksi Gas =====
      const ParagraphBlock(
        '6,00 L propana (C₃H₈) dibakar sempurna pada suhu dan tekanan yang sama '
        'dengan reaksi pembakaran:',
      ),

      const MathBlock(
        r'\text{C}_3\text{H}_8(g) + 5\text{O}_2(g) \rightarrow '
        r'3\text{CO}_2(g) + 4\text{H}_2\text{O}(g)',
      ),

      const ParagraphBlock(
        'Tentukan volume O₂ yang dibutuhkan dan volume CO₂ serta H₂O yang terbentuk!',
      ),

      const ParagraphBlock('Jawab:'),

      const ParagraphBlock(
        'Karena kondisi suhu dan tekanan (T,P) sama, volume gas sebanding dengan '
        'koefisien reaksi.',
        highlight: true,
      ),

      const ParagraphBlock('Diketahui V C₃H₈ = 6,00 L'),

      const MathBlock(
        r'\begin{aligned}'
        r'V_{O_2} &= 5 \times 6{,}00 = 30{,}0\ \text{L} \\'
        r'V_{CO_2} &= 3 \times 6{,}00 = 18{,}0\ \text{L} \\'
        r'V_{H_2O} &= 4 \times 6{,}00 = 24{,}0\ \text{L}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Refleksi =====
      const ParagraphBlock(
        '❓ Pertanyaan berikutnya: Selama ini kita belajar tentang zat padat (gram) '
        'dan gas (liter). Tapi bagaimana dengan larutan (misalnya: garam larut dalam '
        'air)? Apa arti “0,9%” atau “2 M”?',
        highlight: true,
      ),

      // ===== Tahukah Kamu =====
      const ParagraphBlock(
        '🚀 TAHUKAH KAMU?\n'
        'Roket SpaceX Falcon 9 menggunakan perhitungan perbandingan volume gas yang '
        'sangat presisi! Kesalahan 0,1% saja dapat menyebabkan roket gagal mencapai '
        'orbit atau menimbulkan kerugian ratusan juta dolar. Engineer roket adalah '
        'master perhitungan mol dan perbandingan volume. Tanpa kimia, tidak ada '
        'eksplorasi luar angkasa!',
        highlight: true,
      ),
    ];   
  } 
  static List<MateriBlock> materi6() {
    return const [
      HeadingBlock('6. Molaritas dan Hubungannya dengan Mol', level: 1),
      const ParagraphBlock(
        '💉 TAHUKAH KAMU?\n'
        'Cairan infus di rumah sakit adalah larutan NaCl 0,9 M. Konsentrasi ini '
        'sama dengan konsentrasi garam dalam darah kita. Jika lebih pekat atau '
        'lebih encer, kondisi ini bisa berbahaya!',
        highlight: true,
      ),

      // ===== Pengantar =====
      const ParagraphBlock(
        'Molaritas (M) adalah salah satu cara menyatakan konsentrasi atau kepekatan '
        'larutan. Banyaknya zat yang terdapat dalam suatu larutan dapat diketahui '
        'dengan menggunakan konsentrasi larutan yang dinyatakan dalam molaritas (M).',
      ),

      // ===== Ilustrasi =====
      const ImageBlock(
        assetPath: 'assets/images/molaritas-ilustrasi.png',
        width: 280,
        border: true,
        caption: 'Ilustrasi distribusi partikel zat terlarut dalam larutan',
      ),

      // ===== Definisi =====
      const ParagraphBlock(
        'Molaritas menyatakan banyaknya mol zat dalam 1 liter larutan. '
        'Rumus molaritas adalah:',
      ),

      const MathBlock(
        r'M = \frac{n}{V}'
        r'\quad \text{atau} \quad'
        r'n = M \times V',
        highlight: true,
      ),

      // ===== Keterangan =====
      const ParagraphBlock('dengan:'),
      const ParagraphBlock('M = konsentrasi larutan (mol/L)'),
      const ParagraphBlock('n = jumlah mol zat terlarut (mol)'),
      const ParagraphBlock('V = volume larutan (L)'),

      // ===== Contoh 1 =====
      const ParagraphBlock('Contoh:', isBold: true),

      const ParagraphBlock(
        'Berapakah molaritas larutan yang dibuat dengan melarutkan 5,85 gram '
        'NaCl (Ar Na = 23, Cl = 35,5) dalam 500 mL air?',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr NaCl} &= 23 + 35{,}5 = 58{,}5 \\'
        r'\text{mol NaCl} &= \frac{5{,}85}{58{,}5} = 0{,}1 \\'
        r'M &= \frac{0{,}1}{0{,}5} = 0{,}2\ \text{M}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Contoh 2 =====
      const ParagraphBlock(
        'Hitunglah massa NaOH (Ar Na = 23, O = 16, dan H = 1) yang harus '
        'dilarutkan untuk membuat 100 mL larutan NaOH 0,1 M!',
      ),

      const ParagraphBlock('Jawab:'),

      const MathBlock(
        r'\begin{aligned}'
        r'\text{Mr NaOH} &= 23 + 16 + 1 = 40 \\'
        r'\text{massa NaOH} &= M \times V \times \text{Mr} \\'
        r'&= 0{,}1 \times 0{,}1 \times 40 = 0{,}4\ \text{gram}'
        r'\end{aligned}',
        highlight: true,
      ),

      // ===== Refleksi =====
      const ParagraphBlock(
        '❓ Pertanyaan berikutnya: Sekarang kamu sudah menguasai semua konsep '
        'penting. Bagaimana cara menghubungkan SEMUA konsep ini dalam satu '
        'perhitungan kimia?',
        highlight: true,
      ),

      // ===== Tahukah Kamu (Penutup) =====
      const ParagraphBlock(
        '🥤 TAHUKAH KAMU?\n'
        'Minuman isotonik seperti Pocari Sweat dirancang dengan molaritas '
        'elektrolit yang hampir sama dengan cairan tubuh manusia. Tanpa konsep '
        'mol dan molaritas, kita tidak akan memiliki minuman isotonik yang aman '
        'dan efektif. Pada akhirnya, efektivitas minuman isotonik bergantung '
        'pada berapa banyak mol ion yang terlarut dan jumlah partikel kecil '
        'yang bekerja di dalam tubuh!',
        highlight: true,
      ),
    ];   
  } 
  static List<MateriBlock> materi7() {
    return const [
      HeadingBlock('7. Jembatan Mol (Akhir, Sebagai Peta Besar)', level: 1),
      const ParagraphBlock(
        'Bayangkan konsep-konsep yang sudah dipelajari (Massa Zat, Jumlah Partikel,'
        'Volume Gas (STP), dan Molaritas) sebagai empat pintu terpisah dalam sebuah '
        'ruangan. Meskipun semuanya penting, kita tidak bisa berpindah dari satu pintu ke'
        'pintu lain (misalnya, dari Massa langsung ke Volume Gas) tanpa melalui pintu utama.',
      ),

      const ParagraphBlock(
        'Siapa pintu utama di sini? Benar sekali, Mol!',
        highlight: true,
        isBold: true,
      ),

      const ParagraphBlock(
        'Mol adalah kunci emas dan pusat konversi yang menjadi jembatan penghubung bagi semua kuantitas zat.'
        'Dengan mengetahui jumlah mol suatu zat, kita bisa dengan mudah menghitung Massa (menggunakan Massa Molar), '
        'Jumlah Partikel (menggunakan Bilangan Avogadro), Volume Gas (menggunakan 22,4 L/mol),'
        'bahkan Molaritas larutan (menggunakan Volume Larutan).',
      ),

      const ParagraphBlock(
        'Jadi, dalam setiap perhitungan, fokuslah untuk menemukan mol terlebih dahulu, karena semua alur konversi berpusat pada Mol.',
        highlight: true,
      ),

      ImageBlock(
        assetPath: 'assets/images/expanded-mole-bridge.png',
        width: 220,
        caption: 'Ilustrasi Expanded Mole Bridge',
      ),
    ];   
  } 
}