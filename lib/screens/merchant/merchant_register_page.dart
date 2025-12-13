import 'package:flutter/material.dart';
// Pastikan path ini benar

class MerchantRegisterPage extends StatefulWidget {
  const MerchantRegisterPage({super.key});

  @override
  State<MerchantRegisterPage> createState() => _MerchantRegisterPageState();
}

class _MerchantRegisterPageState extends State<MerchantRegisterPage> {
  final Color greenPrimary = const Color(0xFF1E6F5C);

  // List Hari
  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "DATA TOKO",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        foregroundColor: greenPrimary,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("Nama Toko"),
                  _buildTextField(hint: "Masukkan Nama Toko"),

                  _buildLabel("Deskripsi Toko"),
                  _buildTextField(hint: "Masukkan Deskripsi Toko", maxLines: 4),

                  _buildLabel("Alamat Toko"),
                  _buildTextField(hint: "Masukkan Alamat Toko", maxLines: 3),

                  _buildLabel("Nomor Email"),
                  _buildTextField(
                    hint: "Masukkan Email",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  _buildLabel("Nomor HP"),
                  _buildTextField(
                    hint: "Masukkan HP",
                    keyboardType: TextInputType.phone,
                  ),

                  _buildLabel("Password"),
                  _buildTextField(hint: "Masukkan Password", isPassword: true),

                  _buildLabel("Konfirmasi Password"),
                  _buildTextField(hint: "Ulangi Password", isPassword: true),

                  _buildLabel("Foto Profil"),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Pilih Foto disini (jpg,jpg,png)",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Jam Operasional",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  ...days.map((day) => _buildOperationalRow(day)),

                  const SizedBox(height: 30),

                  // --- TOMBOL AKSI ---
                  Row(
                    children: [
                      // Tombol Konfirmasi
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // LOGIKA: Setelah daftar, masuk ke Home
                            Navigator.pushReplacementNamed(
                              context,
                              '/merchant-home',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Konfirmasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Tombol Batal
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Batal",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            // Footer (Opsional, hapus jika error)
            // const CommonFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPERS ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 16),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    bool isPassword = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: isPassword,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildOperationalRow(String day) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              day,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: _buildTimeBox()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("-", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: _buildTimeBox()),
        ],
      ),
    );
  }

  Widget _buildTimeBox() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        "00:00",
        style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
      ),
    );
  }
}
