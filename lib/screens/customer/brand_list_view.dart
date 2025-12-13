import 'package:flutter/material.dart';
import 'brand_detail_page.dart';

class BrandListView extends StatefulWidget {
  const BrandListView({super.key});

  @override
  State<BrandListView> createState() => _BrandListViewState();
}

class _BrandListViewState extends State<BrandListView> {
  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  // DATA FIXED: Semua icon menggunakan icon standar Material Design
  final List<Map<String, dynamic>> brands = [
    {'name': 'Eiger', 'color': const Color(0xFFFF5722), 'icon': Icons.terrain}, 
    {'name': 'Consina', 'color': const Color(0xFF2E7D32), 'icon': Icons.forest}, 
    {'name': 'Rei', 'color': const Color(0xFFD32F2F), 'icon': Icons.hiking}, 
    {'name': 'Arei', 'color': const Color(0xFF1976D2), 'icon': Icons.waves}, 
    {'name': 'Avtech', 'color': const Color(0xFFFBC02D), 'icon': Icons.wb_sunny}, 
    {'name': 'The North Face', 'color': const Color(0xFF212121), 'icon': Icons.ac_unit}, 
    {'name': 'Deuter', 'color': const Color(0xFF0288D1), 'icon': Icons.backpack}, 
    {'name': 'Osprey', 'color': const Color(0xFF7B1FA2), 'icon': Icons.backpack}, // FIXED
    {'name': 'Quechua', 'color': const Color(0xFF009688), 'icon': Icons.nature_people},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          Text("Merek", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: greenDark)),
          const SizedBox(height: 16),
          // Search Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade50,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Cari merek...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 8),
                      icon: Icon(Icons.search, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.0, crossAxisSpacing: 16, mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => _buildBrandCard(brands[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandCard(Map<String, dynamic> brand) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BrandDetailPage(brandName: brand['name'])));
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade100), borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(brand['icon'], color: brand['color'], size: 32),
              const SizedBox(height: 8),
              Text(brand['name'], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}