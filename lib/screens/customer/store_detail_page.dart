import 'package:flutter/material.dart';
import '../../widgets/product_card.dart'; // Reuse kartu produk yang sudah ada

class StoreDetailPage extends StatelessWidget {
  final Map<String, String> storeData;

  const StoreDetailPage({super.key, required this.storeData});

  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah Tab
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Detail Toko",
            style: TextStyle(color: greenDark, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // --- HEADER INFO TOKO ---
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Logo/Badge Toko
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber.shade100,
                    ),
                    child: const Icon(
                      Icons.verified_user,
                      size: 40,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    storeData['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Purwokerto Utara, Banyumas", // Bisa diambil dari data jika ada
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // --- TAB BAR ---
            TabBar(
              labelColor: greenDark,
              unselectedLabelColor: Colors.grey,
              indicatorColor: greenDark,
              indicatorWeight: 3,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "Deskripsi Toko"),
                Tab(text: "Produk"),
              ],
            ),

            // --- TAB VIEW CONTENT ---
            Expanded(
              child: TabBarView(
                children: [
                  // TAB 1: Deskripsi
                  _buildDeskripsiTab(),

                  // TAB 2: Produk
                  _buildProdukTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeskripsiTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow("Alamat", storeData['address']!),
            const SizedBox(height: 20),
            _buildInfoRow("Nomor Telepon", storeData['phone']!),
            const SizedBox(height: 20),
            _buildInfoRow(
              "Jam Buka",
              "Senin       09.00 - 21.00\n"
                  "Selasa      09.00 - 21.00\n"
                  "Rabu        09.00 - 21.00\n"
                  "Kamis       09.00 - 21.00\n"
                  "Jumat       09.00 - 21.00\n"
                  "Sabtu       09.00 - 21.00\n"
                  "Minggu     09.00 - 21.00",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey.shade800,
              height: 1.5,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProdukTab() {
    // Dummy Data Produk Toko Ini
    final List<Map<String, String>> storeProducts = [
      {'title': 'Tenda Consina', 'price': 'Rp. 50.000'},
      {'title': 'Carrier 60L', 'price': 'Rp. 35.000'},
      {'title': 'Kompor Portabel', 'price': 'Rp. 15.000'},
      {'title': 'Matras Camping', 'price': 'Rp. 5.000'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: storeProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final product = storeProducts[index];
          return ProductCard(
            title: product['title']!,
            price: product['price']!, imagePath: '',
          );
        },
      ),
    );
  }
}
