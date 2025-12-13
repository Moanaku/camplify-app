import 'package:flutter/material.dart';
import 'store_detail_page.dart'; // Import halaman detail toko

class StoreListView extends StatefulWidget {
  const StoreListView({super.key});

  @override
  State<StoreListView> createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {
  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  // Data Dummy Toko
  final List<Map<String, String>> stores = [
    {
      'name': 'Purwokerto Adventure',
      'address':
          'Jalan Kalisari, No N-A 7, Sumampir, Kec. Purwokerto Utara, Kabupaten Banyumas, Jawa Tengah 53124',
      'phone': '0858-8423-0584',
      'hours': 'Senin - Minggu (09.00 - 21.00)',
      'products': '20',
    },
    {
      'name': 'Cilacap Outdoor Rental',
      'address':
          'Jl. S. Parman No.12, Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah',
      'phone': '0812-3456-7890',
      'hours': 'Setiap Hari (08.00 - 22.00)',
      'products': '15',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          // 1. Judul Halaman
          Text(
            "Toko",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: greenDark,
            ),
          ),
          const SizedBox(height: 16),

          // 2. Search Bar Khusus Toko
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Cari toko terdekat di sini",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search, size: 18, color: Colors.white),
                label: const Text(
                  "Cari",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 3. List Toko (Looping Data)
          ListView.separated(
            shrinkWrap:
                true, // Agar bisa scroll di dalam SingleChildScrollView induk
            physics: const NeverScrollableScrollPhysics(), // Scroll ikut induk
            itemCount: stores.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return _buildStoreCard(stores[index]);
            },
          ),
        ],
      ),
    );
  }

  // Widget Kartu Toko
  Widget _buildStoreCard(Map<String, String> store) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Toko
          const Icon(
            Icons.storefront_outlined,
            size: 80,
            color: Colors.black87,
          ),
          const SizedBox(height: 12),

          // Nama Toko
          Text(
            store['name']!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: greenDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Alamat
          Text(
            store['address']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade800,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),

          // No HP
          Text(
            store['phone']!,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
          ),
          const SizedBox(height: 8),

          // Jam Buka
          Text(
            store['hours']!,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
          ),
          const SizedBox(height: 8),

          // Info Produk Disewakan
          Text(
            "${store['products']} produk disewakan",
            style: TextStyle(
              fontSize: 12,
              color: greenDark,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Tombol Kunjungi
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreDetailPage(storeData: store),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: greenDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                "Kunjungi Toko",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
