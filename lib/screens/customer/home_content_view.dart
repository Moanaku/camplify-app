import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';
import 'product_detail_page.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    // 1. PASTIKAN PARENT MENGGUNAKAN SCROLL VIEW
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // 2. BANNER PROMO (Fixed Height)
          _buildBanner(),

          const SizedBox(height: 24),

          // 3. SECTION PRODUK (Grid)
          Center(
            child: Text(
              "Produk",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: greenDark,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              "Sewa perlengkapan termurah",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          _buildProductGrid(context),

          const SizedBox(height: 24),

          // 4. SECTION MEREK
          _buildSectionTitle("Merek", () {}),
          const SizedBox(height: 12),
          _buildHorizontalList(
            height: 80,
            itemCount: 4,
            itemBuilder: (i) => _buildBrandItem(i),
          ),

          const SizedBox(height: 24),

          // 5. SECTION KATEGORI
          _buildSectionTitle("Kategori", () {}),
          const SizedBox(height: 12),
          _buildHorizontalList(
            height: 100,
            itemCount: 4,
            itemBuilder: (i) => _buildCategoryItem(i),
          ),

          const SizedBox(height: 24),

          // 6. SECTION TOKO
          _buildSectionTitle("Toko", () {}),
          const SizedBox(height: 12),
          _buildHorizontalList(
            height: 140,
            itemCount: 3,
            itemBuilder: (i) => _buildStoreItem(),
          ),

          // Padding bawah agar tidak mentok
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      // PERBAIKAN UTAMA DI SINI:
      // Diubah dari 200 menjadi 280 agar muat semua konten tanpa overflow
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/images/jaket.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // A. Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // B. Konten Teks & Tombol
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "HOT DEAL",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Judul
                const Text(
                  "Jaket Outdoor\nEiger Hardsell",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.1,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),

                // Subtitle
                const Text(
                  "Sewa buat naik gunung? Gas!",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenPrimary,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: greenPrimary.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "SEWA SEKARANG",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: greenDark,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              "Lihat Selengkapnya",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList({
    required double height,
    required int itemCount,
    required Widget Function(int) itemBuilder,
  }) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) => itemBuilder(index),
      ),
    );
  }

  Widget _buildStoreItem() {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.storefront, size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          const Text(
            "Purwokerto Adv.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            "Lihat Toko >",
            style: TextStyle(fontSize: 10, color: greenPrimary),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandItem(int index) {
    List<IconData> icons = [
      Icons.terrain,
      Icons.forest,
      Icons.hiking,
      Icons.waves,
    ];
    List<Color> colors = [Colors.orange, Colors.green, Colors.red, Colors.blue];
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Icon(icons[index], color: Colors.white, size: 32)),
    );
  }

  Widget _buildCategoryItem(int index) {
    List<Map<String, String>> cats = [
      {'name': 'Tenda', 'img': 'assets/images/tenda2.jpg'},
      {'name': 'Sepatu', 'img': 'assets/images/sepatu.jpg'},
      {'name': 'Jaket', 'img': 'assets/images/jaket.jpg'},
      {'name': 'Kompor', 'img': 'assets/images/kompor.jpg'},
    ];
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Image.asset(
            cats[index]['img']!,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          cats[index]['name']!,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'Tenda Kap. 8 Orang',
        'price': 'Rp 40.000',
        'image': 'assets/images/tenda8.jpg',
      },
      {
        'title': 'Sleeping Bag',
        'price': 'Rp 25.000',
        'image': 'assets/images/sleepingbag.jpg',
      },
      {
        'title': 'Sepatu Gunung',
        'price': 'Rp 30.000',
        'image': 'assets/images/sepatu.jpg',
      },
      {
        'title': 'Kompor',
        'price': 'Rp 15.000',
        'image': 'assets/images/kompor.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    title: products[index]['title']!,
                    price: products[index]['price']!,
                    imagePath: products[index]['image']!,
                  ),
                ),
              );
            },
            child: ProductCard(
              title: products[index]['title']!,
              price: products[index]['price']!,
              imagePath: products[index]['image']!,
            ),
          );
        },
      ),
    );
  }
}
