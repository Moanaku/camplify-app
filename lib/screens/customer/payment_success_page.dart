import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'customer_home.dart'; // IMPORT CUSTOMER HOME

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. Icon Sukses Animasi
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 800),
                tween: Tween<double>(begin: 0, end: 1),
                curve: Curves.elasticOut,
                builder: (context, double value, child) {
                  return Transform.scale(scale: value, child: child);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: greenPrimary, width: 4),
                  ),
                  child: Icon(Icons.check, size: 60, color: greenPrimary),
                ),
              ),

              const SizedBox(height: 30),

              // 2. Teks Judul
              Text(
                "Sukses! Pesanan Kamu\nSudah Kami Terima",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: greenDark,
                ),
              ),
              const SizedBox(height: 12),

              // 3. Subtitle
              Text(
                "Tunjukkan kode booking berikut dan bawa kartu identitas kamu ketika mengambil barang.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, height: 1.5),
              ),

              const SizedBox(height: 30),

              // 4. Kode Booking Card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Kode Booking: #ABC12345",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          const ClipboardData(text: "#ABC12345"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Kode Booking disalin!"),
                          ),
                        );
                      },
                      child: Icon(Icons.copy, size: 18, color: greenPrimary),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // 5. Tombol Kembali
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // PERBAIKAN: Kembali langsung ke CustomerHomePage
                    // pushAndRemoveUntil menghapus riwayat halaman checkout & payment sebelumnya
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerHomePage(),
                      ),
                      (route) => false, // Hapus semua rute sebelumnya
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "KEMBALI KE BERANDA",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
