import 'package:flutter/material.dart';
import 'payment_page.dart'; // IMPORT HALAMAN PEMBAYARAN

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Warna Utama
  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  // State Dummy untuk Metode Pembayaran
  String _selectedPaymentMethod = "Transfer Bank";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background sedikit abu terang
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // KONTEN SCROLLABLE
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Profil Penyewa
                  _buildSectionTitle("Profil Penyewa"),
                  _buildRenterProfileCard(),

                  const SizedBox(height: 24),

                  // 2. Detail Pesanan (Per Toko)
                  _buildSectionTitle("Purwokerto Adventure"), // Nama Toko
                  _buildOrderItemCard(),

                  const SizedBox(height: 24),

                  // 3. Upload KTP
                  _buildUploadSection(),

                  const SizedBox(height: 24),

                  // 4. Metode Pembayaran
                  _buildSectionTitle("Metode Pembayaran"),
                  _buildPaymentMethodSection(),

                  const SizedBox(height: 24),

                  // 5. Ringkasan Transaksi
                  _buildSectionTitle("Ringkasan Transaksi"),
                  _buildSummarySection(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // BOTTOM BAR (TOMBOL BAYAR)
          _buildBottomPaymentBar(),
        ],
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          color: greenDark,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 1. Kartu Profil Penyewa
  Widget _buildRenterProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              // Tombol Edit
              SizedBox(
                height: 30,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: greenPrimary),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Edit",
                    style: TextStyle(fontSize: 12, color: greenPrimary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Jl. Di Panjaitan No.128, Karangreja, Purwokerto Kidul, Kec. Purwokerto Sel., Kabupaten Banyumas, Jawa Tengah 53147",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "081123456789",
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 2. Kartu Item Pesanan
  Widget _buildOrderItemCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.home_filled,
              color: Colors.grey,
              size: 30,
            ), // Placeholder Tenda
          ),
          const SizedBox(width: 12),
          // Detail Produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tenda kap. 4 orang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                // Tanggal Sewa
                Text(
                  "10 Jan - 12 Jan 2025",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                const SizedBox(height: 8),
                // Harga & Qty
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "1 x",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp200.000",
                      style: TextStyle(
                        color: greenDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Upload KTP Section
  Widget _buildUploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.cloud_upload_outlined,
            size: 40,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            "Upload KTP/SIM penyewa (.jpg, .png, .jpeg)",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // 4. Metode Pembayaran Section
  Widget _buildPaymentMethodSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildPaymentTile("Transfer Bank", Icons.account_balance),
          const Divider(height: 1),
          _buildPaymentTile("QRIS", Icons.qr_code),
        ],
      ),
    );
  }

  Widget _buildPaymentTile(String title, IconData icon) {
    final bool isSelected = _selectedPaymentMethod == title;
    return ListTile(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title;
        });
      },
      leading: Icon(icon, color: isSelected ? greenPrimary : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? greenDark : Colors.black87,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: greenPrimary)
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }

  // 5. Ringkasan Transaksi
  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildSummaryRow("Total harga (1 produk)", "Rp200.000"),
          const SizedBox(height: 8),
          _buildSummaryRow("Fee platform", "Rp1.000"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Tagihan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp201.000",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: greenDark,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }

  // Bottom Bar Sticky
  Widget _buildBottomPaymentBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // NAVIGASI KE HALAMAN PEMBAYARAN
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: greenDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Bayar Sekarang",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
