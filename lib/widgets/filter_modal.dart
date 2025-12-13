import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  // Warna Utama
  final Color greenDark = const Color(0xFF1E6F5C);

  // --- 1. DATA STATE (Lebih Minimalis menggunakan Map) ---
  // Format: "Nama Item": Status (true/false)
  final Map<String, bool> _categories = {
    'Tas': false,
    'Sepatu': false,
    'Tenda': false,
  };

  final Map<String, bool> _locations = {
    'Purwokerto': false,
    'Cilacap': false,
    'Kebumen': false,
  };

  final Map<String, bool> _brands = {
    'Consina': false,
    'Eiger': false,
    'Rei': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Drag Handle ---
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // --- Judul & Reset ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: greenDark,
                ),
              ),
              TextButton(
                onPressed: _resetFilters,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // --- ISI FILTER (Scrollable) ---
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Kategori (Static List)
                  _buildSectionTitle("Kategori"),
                  ..._categories.keys.map((key) {
                    return _buildMinimalCheckbox(key, _categories);
                  }),

                  _buildDivider(),

                  // 2. Lokasi (Expandable)
                  _buildExpandableSection("Lokasi", _locations),

                  _buildDivider(),

                  // 3. Merek (Expandable)
                  _buildExpandableSection("Merek", _brands),
                ],
              ),
            ),
          ),

          // --- TOMBOL APPLY ---
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenDark,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "APPLY",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS (Agar kode utama bersih) ---

  // 1. Widget Judul Section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  // 2. Widget Checkbox Minimalis
  Widget _buildMinimalCheckbox(String key, Map<String, bool> dataMap) {
    return CheckboxListTile(
      title: Text(
        key,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      value: dataMap[key],
      activeColor: greenDark,
      dense: true, // Membuat baris lebih rapat
      contentPadding: EdgeInsets.zero, // Menghilangkan padding default
      controlAffinity: ListTileControlAffinity.leading, // Checkbox di kiri
      visualDensity: VisualDensity.compact, // Mengurangi jarak vertikal
      side: BorderSide(color: Colors.grey.shade400),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onChanged: (val) {
        setState(() {
          dataMap[key] = val!;
        });
      },
    );
  }

  // 3. Widget Section yang Bisa Di-expand (Lokasi & Merek)
  Widget _buildExpandableSection(String title, Map<String, bool> dataMap) {
    return Theme(
      // Menghilangkan garis border default ExpansionTile
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        initiallyExpanded: true,
        iconColor: greenDark,
        collapsedIconColor: Colors.grey,
        children: dataMap.keys.map((key) {
          return _buildMinimalCheckbox(key, dataMap);
        }).toList(),
      ),
    );
  }

  // 4. Divider Tipis
  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade200, thickness: 1, height: 20);
  }

  // Logic Reset
  void _resetFilters() {
    setState(() {
      _categories.updateAll((key, value) => false);
      _locations.updateAll((key, value) => false);
      _brands.updateAll((key, value) => false);
    });
  }
}
