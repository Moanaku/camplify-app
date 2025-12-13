import 'package:flutter/material.dart';

class CommonFooter extends StatelessWidget {
  const CommonFooter({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi warna langsung di sini atau ambil dari constants jika sudah ada
    const Color darkFooter = Color(0xFF212529);
    const Color greenPrimary = Color(0xFF5B9E77);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
      decoration: const BoxDecoration(
        color: darkFooter,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- UPDATE LOGO DI SINI ---
          Row(
            children: [
              // Menggunakan Image Asset alih-alih Icon
              Image.asset(
                'assets/images/camplify.png', // Pastikan path ini benar
                height: 32, // Sesuaikan tinggi dengan ukuran teks
                fit: BoxFit.contain,
                // Jika warna di gambar tidak hijau, bisa di-tint (opsional):
                // color: greenPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                "Camplify",
                style: TextStyle(
                  color: greenPrimary.withOpacity(0.8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif', // Pastikan font ini tersedia
                ),
              ),
            ],
          ),

          // --- AKHIR UPDATE LOGO ---
          const SizedBox(height: 16),
          const Text(
            "Jl. DI Panjaitan No.128,\nKarangreja, Purwokerto Kidul,\nKec. Purwokerto Sel., Kabupaten\nBanyumas, Jawa Tengah",
            style: TextStyle(color: Colors.white, height: 1.5, fontSize: 14),
          ),
          const SizedBox(height: 24),
          const Text(
            "Menu Navigasi",
            style: TextStyle(
              color: greenPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildFooterLink("Beranda"),
          _buildFooterLink("Merek"),
          _buildFooterLink("Kategori"),
          _buildFooterLink("Produk"),
          _buildFooterLink("Toko"),
          const SizedBox(height: 30),
          const Divider(color: Colors.white24), // Opsional: Garis pemisah tipis
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "© 2025 Camplify | Allright Reserved",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
