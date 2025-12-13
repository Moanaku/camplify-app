import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    // DATA KATEGORI (Semua menggunakan gambar dari assets)
    final List<Map<String, String>> categories = [
      {
        'name': 'Tenda',
        'image': 'assets/images/tenda2.jpg', // NAMA BARU (Tanpa Spasi)
      },
      {'name': 'Sepatu', 'image': 'assets/images/sepatu.jpg'},
      {'name': 'Jaket', 'image': 'assets/images/jaket.jpg'},
      {'name': 'Kompor', 'image': 'assets/images/kompor.jpg'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          // 1. Judul Halaman
          Text(
            "Kategori",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: greenDark,
            ),
          ),
          const SizedBox(height: 16),

          // 2. Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Cari kategori di sini",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 9),
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search, size: 16, color: Colors.white),
                  label: const Text(
                    "Cari",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenDark,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(4),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 3. Grid Kategori
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return _buildCategoryCard(cat);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, String> cat) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BAGIAN GAMBAR
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                cat['image']!,
                fit: BoxFit.contain, // Agar gambar tidak terpotong
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.broken_image,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Img Error",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // BAGIAN TEXT
          Expanded(
            flex: 1,
            child: Text(
              cat['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
