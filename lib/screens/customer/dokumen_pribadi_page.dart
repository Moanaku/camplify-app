import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/common_footer.dart';
import '../../widgets/upload_placeholder.dart';

class DokumenPribadiPage extends StatelessWidget {
  const DokumenPribadiPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenDarkBtn = Color(0xFF1E6F5C);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dokumen Pribadi", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section KTP
                  const Text("Dokumen Pribadi", style: TextStyle(color: greenDarkBtn, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  const UploadPlaceholder(
                    label: "KTP", 
                    placeholderText: "Unggah Foto disini (jpg,jpg,png)"
                  ),

                  // Section Metode Pembayaran
                  const SizedBox(height: 10),
                  const Text("Metode Pembayaran", style: TextStyle(color: greenDarkBtn, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  const CustomTextField(label: "Nama Bank", hint: "Masukkan Nama Bank"),
                  const CustomTextField(label: "Nama Pemilik", hint: "Masukkan Nama Pemilik"),
                  const CustomTextField(label: "Nomor Rekening", hint: "Masukkan Nomor Rekening", keyboardType: TextInputType.number),

                  // Section E-wallet
                  const SizedBox(height: 10),
                  const Text("E-wallet", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  // Label Dana & LinkAja agak unik (Label di kiri, Input di kanan) sesuai gambar
                  // Tapi agar konsisten dengan CustomTextField, kita pakai style standar dulu.
                  const CustomTextField(label: "Dana", hint: "Masukkan Nomor ID", keyboardType: TextInputType.phone),
                  const CustomTextField(label: "Linkaja", hint: "Masukkan Nomor ID", keyboardType: TextInputType.phone),

                  const SizedBox(height: 30),

                   // Tombol Konfirmasi
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenDarkBtn,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text("Konfirmasi", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text("Batal", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CommonFooter(),
          ],
        ),
      ),
    );
  }
}