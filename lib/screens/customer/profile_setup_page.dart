import 'package:flutter/material.dart';
import '../../widgets/common_footer.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  static const Color greenPrimary = Color(0xFF5B9E77);
  static const Color greenDarkBtn = Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HEADER (Agar konsisten dengan halaman lain)
            _buildHeader(size),

            // 2. BODY (Menu Pilihan)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                children: [
                  const Text(
                    "Lengkapi Profil Anda",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Data ini diperlukan untuk verifikasi akun customer",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),

                  // Menu 1: Biodata Diri
                  _buildMenuCard(
                    context,
                    title: "Biodata Diri",
                    subtitle: "Isi nama, alamat, dan data dasar",
                    icon: Icons.person_pin_circle_outlined,
                    route: '/biodata-diri',
                    isCompleted: false, // Nanti bisa dipasang logika if data exists
                  ),

                  const SizedBox(height: 16),

                  // Menu 2: Dokumen Pribadi
                  _buildMenuCard(
                    context,
                    title: "Dokumen Pribadi",
                    subtitle: "Upload KTP dan metode pembayaran",
                    icon: Icons.folder_shared_outlined,
                    route: '/dokumen-pribadi',
                    isCompleted: false,
                  ),

                  const SizedBox(height: 40),

                  // Tombol Selesai (Navigasi ke Home Utama)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Di sini nanti kita cek apakah data sudah lengkap semua
                        // Untuk sekarang, kita izinkan masuk ke Home Customer
                         Navigator.pushReplacementNamed(context, '/customer-home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greenDarkBtn,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Selesai & Masuk Beranda",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. FOOTER
            const CommonFooter(),
          ],
        ),
      ),
    );
  }

  // Widget Header Lengkung
  Widget _buildHeader(Size size) {
    return Container(
      height: size.height * 0.25, // Tidak perlu setinggi halaman login
      width: double.infinity,
      decoration: const BoxDecoration(
        color: greenPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.assignment_ind,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Setup Profil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Kartu Menu (Reusable untuk halaman ini)
  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCompleted ? Colors.green : Colors.grey.shade200,
            width: isCompleted ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F9F6), // Hijau sangat muda
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: greenDarkBtn, size: 28),
            ),
            const SizedBox(width: 16),
            // Text Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Arrow / Check Icon
            Icon(
              isCompleted ? Icons.check_circle : Icons.arrow_forward_ios,
              color: isCompleted ? Colors.green : Colors.grey[400],
              size: isCompleted ? 24 : 16,
            ),
          ],
        ),
      ),
    );
  }
}