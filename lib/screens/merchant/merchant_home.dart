import 'package:flutter/material.dart';

class MerchantHomePage extends StatelessWidget {
  const MerchantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[50], // Background agak abu terang biar konten menonjol
      appBar: AppBar(
        title: const Text(
          "Dashboard Toko",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Warna teks/icon hitam
        elevation: 0.5,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              radius: 18,
              child: const Icon(Icons.store, color: Colors.green, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN 1: STATISTIK (Grid 2 Kolom) ---
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Agar tidak scroll sendiri
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4, // Mengatur lebar vs tinggi kartu
              children: [
                _buildStatCard(
                  title: "Total User",
                  value: "40,689",
                  trend: "+8.5% Up from yesterday",
                  icon: Icons.group,
                  iconColor: Colors.purple,
                  bgColor: const Color(0xFFF3E8FF),
                ),
                _buildStatCard(
                  title: "Total Sewa",
                  value: "10,293",
                  trend: "+1.3% Up from past week",
                  icon: Icons.inventory_2,
                  iconColor: Colors.orange,
                  bgColor: const Color(0xFFFFF7E6),
                ),
                _buildStatCard(
                  title: "Pendapatan",
                  value: "Rp 89jt",
                  trend: "+4.3% Down from yesterday",
                  icon: Icons.monetization_on,
                  iconColor: Colors.green,
                  bgColor: const Color(0xFFE6FFFA),
                  isDown: true,
                ),
                _buildStatCard(
                  title: "Pending",
                  value: "2,040",
                  trend: "+1.8% Up from yesterday",
                  icon: Icons.pending_actions,
                  iconColor: Colors.redAccent,
                  bgColor: const Color(0xFFFFEBEB),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // --- BAGIAN 2: GRAFIK PENJUALAN (Placeholder) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sales Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Text("October", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 220,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Simulasi Grafik dengan Icon
                  Icon(
                    Icons.bar_chart_rounded,
                    size: 100,
                    color: Colors.green.shade300,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Grafik Penjualan Bulanan",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- BAGIAN 3: TABEL PESANAN TERBARU ---
            const Text(
              "Pesanan Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal, // Scroll samping jika layar sempit
                child: DataTable(
                  horizontalMargin: 12,
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(
                      label: Text(
                        "ID",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Produk",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Penyewa",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: [
                    _buildDataRow(
                      "001",
                      "Tenda Eiger",
                      "Christine",
                      "Selesai",
                      Colors.green,
                    ),
                    _buildDataRow(
                      "002",
                      "Sepatu Hiking",
                      "Budi S.",
                      "Pending",
                      Colors.orange,
                    ),
                    _buildDataRow(
                      "003",
                      "Carrier 60L",
                      "Siti A.",
                      "Selesai",
                      Colors.green,
                    ),
                    _buildDataRow(
                      "004",
                      "Matras",
                      "Joko A.",
                      "Batal",
                      Colors.red,
                    ),
                    _buildDataRow(
                      "005",
                      "Flysheet",
                      "Rina M.",
                      "Selesai",
                      Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40), // Spacing bawah agar tidak mentok
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER: KARTU STATISTIK ---
  Widget _buildStatCard({
    required String title,
    required String value,
    required String trend,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    bool isDown = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            children: [
              Icon(
                isDown ? Icons.trending_down : Icons.trending_up,
                color: isDown ? Colors.red : Colors.green,
                size: 14,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  trend,
                  style: TextStyle(
                    color: isDown ? Colors.red : Colors.green,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER: BARIS TABEL ---
  DataRow _buildDataRow(
    String id,
    String product,
    String name,
    String status,
    Color color,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(id, style: const TextStyle(color: Colors.grey))),
        DataCell(
          Text(product, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        DataCell(Text(name)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
