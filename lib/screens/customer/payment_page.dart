import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk fitur copy paste
import 'payment_success_page.dart'; // Import halaman sukses

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pembayaran",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. TIMER SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time_filled, color: greenPrimary),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bayar Sebelum", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text("02 Juli 2025, 15:37 WIB", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ),
                  // Dummy Countdown
                  _buildTimeBox("23"),
                  const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold)),
                  _buildTimeBox("59"),
                  const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold)),
                  _buildTimeBox("00"),
                ],
              ),
            ),
            
            const SizedBox(height: 20),

            // 2. VIRTUAL ACCOUNT INFO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Bank
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Nomor Virtual Account", style: TextStyle(color: Colors.grey)),
                      // Logo Bank Dummy (Text Style)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Text("BCA", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Nomor VA & Copy
                  Row(
                    children: [
                      const Text(
                        "80777081128890099",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(const ClipboardData(text: "80777081128890099"));
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Nomor VA disalin!")));
                        },
                        child: Icon(Icons.copy, size: 18, color: greenPrimary),
                      ),
                    ],
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),

                  // Total Tagihan
                  const Text("Total Tagihan", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    "Rp201.000",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greenDark),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. CARA PEMBAYARAN (Accordion)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Cara Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  ),
                  _buildInstructionTile("ATM BCA"),
                  const Divider(height: 1),
                  _buildInstructionTile("m-BCA (BCA Mobile)"),
                  const Divider(height: 1),
                  _buildInstructionTile("Internet Banking BCA"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 4. TOMBOL CEK STATUS (Simulasi Sukses)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Langsung ke halaman sukses (Simulasi pembayaran berhasil)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenDark,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "Cek Status Pembayaran",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
             const SizedBox(height: 12),
             Center(
               child: TextButton(
                 onPressed: () => Navigator.pop(context),
                 child: const Text("Bayar Nanti", style: TextStyle(color: Colors.grey)),
               ),
             )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: greenDark,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        time,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInstructionTile(String title) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      expandedAlignment: Alignment.centerLeft,
      children: const [
        Text(
          "1. Masukkan Kartu ATM BCA & PIN\n2. Pilih menu Transaksi Lainnya > Transfer > ke Rekening BCA Virtual Account\n3. Masukkan nomor VA di atas\n4. Pastikan data benar, lalu konfirmasi",
          style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
        ),
      ],
    );
  }
}