import 'package:flutter/material.dart';
// Pastikan import widget ini benar sesuai struktur folder Anda
import '../../widgets/custom_text_field.dart';
import '../../widgets/common_footer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            // 1. HEADER (GAMBAR WELCOME)
            _buildHeader(size),

            // 2. BODY
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Daftar sebagai Customer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Google Button
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 30,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Google",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color(0xFFE3F2FD),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Center(
                    child: Text("Atau", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 20),

                  const CustomTextField(
                    label: "Email",
                    hint: "Masukkan email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  const CustomTextField(
                    label: "Password",
                    hint: "Masukkan password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  const SizedBox(height: 24),

                  // Tombol Daftar
                  ElevatedButton(
                    onPressed: () {
                      // Logika pendaftaran di sini

                      // Arahkan ke Profile Setup
                      Navigator.pushReplacementNamed(context, '/profile-setup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenDarkBtn,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Link ke Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah Punya Akun? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            color: greenPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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

  // --- PERBAIKAN DI SINI ---
  Widget _buildHeader(Size size) {
    return Container(
      height: size.height * 0.35, // Tinggi 35% dari layar
      width: double.infinity,
      decoration: const BoxDecoration(
        color: greenPrimary, // Background Hijau
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      // Menggunakan Image.asset (Welcome Image) alih-alih Icon
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            30.0,
          ), // Padding agar gambar tidak terlalu besar
          child: Image.asset(
            'assets/images/welcome.png', // Gambar yang sama dengan Role Selection
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
