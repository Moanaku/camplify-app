import 'package:flutter/material.dart';
import '../../widgets/common_footer.dart';
import '../../widgets/product_card.dart'; // Reuse widget kartu produk

class ProductDetailPage extends StatefulWidget {
  // Kita terima data dari halaman sebelumnya
  final String title;
  final String price;
  final String imagePath; // PARAMETER BARU (Wajib)

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Color greenDark = const Color(0xFF1E6F5C);

  // State Jumlah Barang
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- APP BAR SESUAI DESAIN PILIHAN ANDA ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Cari barang di sini",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        actions: const [
          Icon(Icons.filter_list),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16),
          Icon(Icons.person_outline),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. GAMBAR PRODUK (UPDATED: Menggunakan Image Asset)
            Container(
              height: 300,
              width: double.infinity,
              color: const Color(0xFFF5F5F5),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover, // Gambar memenuhi area
                errorBuilder: (ctx, err, stack) =>
                    const Icon(Icons.image, size: 100, color: Colors.grey),
              ),
            ),

            // Thumbnail Kecil (Preview)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildThumbnail(true, widget.imagePath), // Aktif
                  const SizedBox(width: 10),
                  _buildThumbnail(false, widget.imagePath),
                  const SizedBox(width: 10),
                  _buildThumbnail(false, widget.imagePath),
                ],
              ),
            ),

            // 2. INFO PRODUK
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: greenDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "*harga sewa per malam",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Consina - Stok 3",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 24),

                  // 3. INPUT TANGGAL
                  Row(
                    children: [
                      Expanded(child: _buildDateInput("Tanggal Mulai")),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDateInput("Tanggal Selesai")),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 4. INPUT JUMLAH
                  const Text(
                    "Jumlah",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => setState(() {
                            if (_quantity > 1) _quantity--;
                          }),
                          icon: const Icon(Icons.remove),
                        ),
                        Expanded(child: Center(child: Text("$_quantity"))),
                        IconButton(
                          onPressed: () => setState(() => _quantity++),
                          icon: const Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 5. TOMBOL ORDER
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Masuk Keranjang!")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greenDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 6. DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint(
                    "Fitur: Ringan, mudah didirikan, tahan air, ventilasi baik.",
                  ),
                  _buildBulletPoint(
                    "Material: Polyester 210T PU, rangka aluminium.",
                  ),
                  _buildBulletPoint("Ukuran: 250 x 200 x 140 cm"),
                  _buildBulletPoint("Kapasitas: 4 orang"),
                  _buildBulletPoint("Kegunaan: Camping keluarga, piknik."),
                  _buildBulletPoint(
                    "Keunggulan: Ringan, mudah dibawa, desain modern.",
                  ),

                  const SizedBox(height: 24),
                  const Divider(thickness: 2),
                  const SizedBox(height: 16),

                  // 7. PRODUK LAINNYA
                  Text(
                    "Produk lainnya",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: greenDark,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Horizontal List
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        SizedBox(
                          width: 160,
                          child: ProductCard(
                            title: "Carrier 60L",
                            price: "Rp 50.000",
                            imagePath: "assets/images/jaket.jpg", // Dummy image
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 160,
                          child: ProductCard(
                            title: "Carrier 45L",
                            price: "Rp 40.000",
                            imagePath:
                                "assets/images/sepatu.jpg", // Dummy image
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 160,
                          child: ProductCard(
                            title: "Carrier 75L",
                            price: "Rp 60.000",
                            imagePath:
                                "assets/images/kompor.jpg", // Dummy image
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const CommonFooter(),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER ---

  Widget _buildThumbnail(bool isActive, String imgPath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? greenDark : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(imgPath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildDateInput(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 6),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("dd/mm/yy", style: TextStyle(color: Colors.grey))],
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(height: 1.4, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
