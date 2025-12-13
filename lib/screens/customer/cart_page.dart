import 'package:flutter/material.dart';
import 'checkout_page.dart'; // IMPORT HALAMAN CHECKOUT

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  // State sederhana untuk menyimpan status checklist (Hardcoded untuk demo UI)
  // Index 0: Tenda (True), Index 1: Sleeping Bag (False), Index 2: Kompor (False)
  List<bool> checkedItems = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Keranjang Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 1. LIST ITEM KERANJANG
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildCartItem(
                  index: 0,
                  title: "Tenda Kap. 4 Orang",
                  price: "Rp. 200.000",
                  dates: "10 Jan - 12 Jan 2025",
                  image: Icons.home_filled,
                  days: 2,
                ),
                const SizedBox(height: 16),
                _buildCartItem(
                  index: 1,
                  title: "Sleeping Bag Eiger",
                  price: "Rp. 25.000",
                  dates: "10 Jan - 12 Jan 2025",
                  image: Icons.bed,
                  days: 2,
                ),
                const SizedBox(height: 16),
                _buildCartItem(
                  index: 2,
                  title: "Kompor Portabel",
                  price: "Rp. 15.000",
                  dates: "15 Feb - 17 Feb 2025",
                  image: Icons.local_fire_department,
                  days: 2,
                ),
              ],
            ),
          ),

          // 2. BOTTOM CHECKOUT SECTION
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Sewa", style: TextStyle(color: Colors.grey)),
                    // Harga hanya menghitung yang dicentang (Hardcoded sesuai Tenda)
                    Text(
                      "Rp. 200.000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // NAVIGASI KE HALAMAN CHECKOUT
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Checkout (1)",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required int index,
    required String title,
    required String price,
    required String dates,
    required IconData image,
    required int days,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox (Dinamis berdasarkan index)
          Center(
            child: Checkbox(
              value:
                  checkedItems[index], // Mengambil nilai true/false dari List
              activeColor: greenDark,
              onChanged: (bool? val) {
                setState(() {
                  checkedItems[index] = val ?? false;
                });
              },
            ),
          ),

          // Image Placeholder
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(image, color: Colors.grey, size: 30),
          ),
          const SizedBox(width: 12),

          // Info Produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // TANGGAL SEWA
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dates,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Harga & Durasi Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$price / hari",
                      style: TextStyle(
                        color: greenPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "$days Hari",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
