import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: greenPrimary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HEADER PROFIL (UPDATED DENGAN FOTO)
            _buildProfileHeader(),

            // 2. STATUS PESANAN
            _buildOrderStatus(),

            const SizedBox(height: 10),

            // 3. MENU OPSI
            _buildMenuOption(
              icon: Icons.person_outline,
              title: "Edit Biodata Diri",
              onTap: () {
                Navigator.pushNamed(context, '/biodata-diri');
              },
            ),
            _buildMenuOption(
              icon: Icons.file_present_outlined,
              title: "Dokumen Pribadi",
              onTap: () {
                Navigator.pushNamed(context, '/dokumen-pribadi');
              },
            ),
            _buildMenuOption(
              icon: Icons.history,
              title: "Riwayat Transaksi",
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.favorite_border,
              title: "Wishlist Saya",
              onTap: () {},
            ),
            _buildMenuOption(
              icon: Icons.help_outline,
              title: "Bantuan & Dukungan",
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // 4. TOMBOL LOGOUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      "Keluar",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Versi Aplikasi 1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: greenPrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Column(
        children: [
          // --- BAGIAN FOTO PROFIL (UPDATED) ---
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  // GANTI 'assets/images/profile.jpg' DENGAN NAMA FILE KAMU
                  backgroundImage: AssetImage('assets/images/profil.jpg'),

                  // Jika ingin pakai URL internet, gunakan ini:
                  // backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
              ),
              // Tombol Edit Kamera Kecil
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: greenPrimary, width: 2),
                  ),
                  child: Icon(Icons.camera_alt, size: 16, color: greenPrimary),
                ),
              ),
            ],
          ),

          // --- END BAGIAN FOTO ---
          const SizedBox(height: 16),

          // Nama User
          const Text(
            "Dani Banan Husna",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "bananhusna@gmail.com",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatusItem(Icons.payment, "Belum Bayar"),
          _buildStatusItem(Icons.inventory_2_outlined, "Dikemas"),
          _buildStatusItem(Icons.local_shipping_outlined, "Dikirim"),
          _buildStatusItem(Icons.star_outline, "Beri Nilai"),
        ],
      ),
    );
  }

  Widget _buildStatusItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: greenDark, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: greenDark),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
