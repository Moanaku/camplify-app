import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';

class BrandDetailPage extends StatelessWidget {
  final String brandName;

  const BrandDetailPage({super.key, required this.brandName});

  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    // Dummy Produk untuk halaman ini
    final List<Map<String, String>> brandProducts = [
      {'title': 'Carrier $brandName 60L', 'price': 'Rp. 45.000'},
      {'title': 'Jaket $brandName Waterproof', 'price': 'Rp. 30.000'},
      {'title': 'Tenda $brandName 4P', 'price': 'Rp. 80.000'},
      {'title': 'Sepatu Hiking $brandName', 'price': 'Rp. 35.000'},
      {'title': 'Tas Selempang $brandName', 'price': 'Rp. 15.000'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          brandName, // Judul sesuai nama merek
          style: TextStyle(color: greenDark, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: greenDark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner/Header Merek (Opsional, untuk estetika)
            Container(
              width: double.infinity,
              height: 120,
              color: greenDark.withOpacity(0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified, size: 40, color: greenDark),
                  const SizedBox(height: 8),
                  Text(
                    "Official Store $brandName",
                    style: TextStyle(
                      color: greenDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Grid Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: brandProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = brandProducts[index];
                  return ProductCard(
                    title: product['title']!,
                    price: product['price']!,
                    imagePath: '',
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
