import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  // --- Color Palette Configuration ---
  static const Color greenPrimary = Color(0xFF5B9E77);
  static const Color greenDarkBtn = Color(0xFF1E6F5C);
  static const Color greenLightBtn = Color(0xFF6AB085);
  static const Color darkFooter = Color(0xFF212529);
  static const Color textGrey = Color(0xFF6C757D);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(size),
            _buildBody(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  /// SECTION 1: Header (Top with Image)
  Widget _buildHeader(Size size) {
    return SizedBox(
      height: size.height * 0.45,
      child: Stack(
        children: [
          // Background Hijau
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: greenPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          // Gambar Welcome
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'assets/images/welcome.png',
                  fit: BoxFit.contain,
                  errorBuilder: (ctx, error, stackTrace) => const Icon(
                    Icons.image_not_supported,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Glass Cards
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGlassCard(),
                const SizedBox(width: 10),
                _buildGlassCard(height: 50, width: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard({double width = 50, double height = 70}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
    );
  }

  /// SECTION 2: Body (Action Buttons)
  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- TOMBOL MERCHANT ---
          _buildActionButton(
            label: "Daftar sebagai Merchant",
            icon: Icons.store_mall_directory_outlined,
            color: greenDarkBtn,
            onTap: () => Navigator.pushNamed(context, '/register-merchant'),
          ),

          const SizedBox(height: 25),

          const Row(
            children: [
              Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: textGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
            ],
          ),

          const SizedBox(height: 25),

          // Tombol Customer
          _buildActionButton(
            label: "Daftar sebagai Customer",
            icon: Icons.person_outline,
            color: greenLightBtn,
            onTap: () => Navigator.pushNamed(context, '/register'),
          ),

          const SizedBox(height: 25),

          // Login Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sudah Punya Akun? ",
                style: TextStyle(color: textGrey),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: greenDarkBtn,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          shadowColor: color.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  /// SECTION 3: Footer (Bottom) - UPDATED
  Widget _buildFooter(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Agar logo & teks rata tengah secara vertikal
            children: [
              // --- PERBAIKAN: Menggunakan Image Asset Logo ---
              // Ganti 'assets/images/logo_camplify.png' sesuai nama file aslimu
              Image.asset(
                'assets/images/camplify.png',
                height: 40,
                // Jika logomu hitam dan ingin diubah putih, uncomment baris bawah:
                // color: Colors.white,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback jika gambar belum ada/gagal load
                  return const Icon(
                    Icons.broken_image,
                    color: greenPrimary,
                    size: 30,
                  );
                },
              ),

              const SizedBox(width: 12),

              Text(
                "Camplify",
                style: TextStyle(
                  color: greenPrimary.withOpacity(0.9),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Jl. DI Panjaitan No.128,\nKarangreja, Purwokerto Kidul,\nKec. Purwokerto Sel., Kabupaten\nBanyumas, Jawa Tengah",
            style: TextStyle(color: Colors.white, height: 1.5, fontSize: 14),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white24),
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
}
