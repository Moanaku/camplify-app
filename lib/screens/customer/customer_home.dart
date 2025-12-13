import 'package:flutter/material.dart';
import '../../widgets/common_footer.dart';
import '../../widgets/product_card.dart';
import '../../widgets/filter_modal.dart';
import 'product_detail_page.dart';
import 'store_list_view.dart';
import 'brand_list_view.dart';
import 'category_list_view.dart';
import 'profile_page.dart';
import 'cart_page.dart';
import 'home_content_view.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final Color greenPrimary = const Color(0xFF5B9E77);
  final Color greenDark = const Color(0xFF1E6F5C);

  int _selectedIndex = 0; // Default Beranda

  // Menu Items
  final List<String> _menuItems = [
    "Beranda",
    "Produk",
    "Merek",
    "Kategori",
    "Toko",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Custom App Bar (Logo Image, Search, Icons)
              _buildCustomAppBar(context),

              // 2. Menu Bar (Tab Kategori)
              _buildMenuBar(),

              // 3. LOGIC GANTI HALAMAN
              if (_selectedIndex == 0) ...[
                // BERANDA
                const HomeContentView(),
              ] else if (_selectedIndex == 1) ...[
                // PRODUK
                _buildProductHeader(),
                _buildProductGrid(),
              ] else if (_selectedIndex == 2) ...[
                // MEREK
                const BrandListView(),
              ] else if (_selectedIndex == 3) ...[
                // KATEGORI
                const CategoryListView(),
              ] else if (_selectedIndex == 4) ...[
                // TOKO
                const StoreListView(),
              ],

              const SizedBox(height: 40),
              // 4. Footer
              const CommonFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // --- BAGIAN LOGO (UPDATED) ---
          // Menggunakan Image.asset sesuai request
          Image.asset(
            'assets/images/camplify.png',
            height:
                32, // Tinggi disesuaikan agar rapi sejajar dengan Search Bar
            fit: BoxFit.contain,
          ),

          // -----------------------------
          const SizedBox(width: 12),

          // Search Bar
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari barang...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Icons Kanan (Filter, Cart, Profile)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const FilterModal(),
                  );
                },
                child: const Icon(Icons.filter_list, color: Colors.black87),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.black87,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_menuItems.length, (index) {
            final bool isActive = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border: isActive
                      ? Border(bottom: BorderSide(color: greenDark, width: 3))
                      : null,
                ),
                child: Text(
                  _menuItems[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? greenDark : Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildProductHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Column(
        children: [
          Text(
            "Produk",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: greenDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Sewa alat teman daki. Berbagai jenis barang sudah dirawat, siap pakai, dan mudah penggunaannya.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // Dummy Data Produk untuk Tab "Produk"
  final List<Map<String, String>> _dummyProductsTab = [
    {
      'title': 'Tenda Kap. 8 Orang',
      'price': 'Rp 40.000',
      'image': 'assets/images/tenda8.jpg',
    },
    {
      'title': 'Treking Pole',
      'price': 'Rp 20.000',
      'image': 'assets/images/trekingpole2.jpg',
    },
    {
      'title': 'Fly Sheet',
      'price': 'Rp 25.000',
      'image': 'assets/images/flysheet.jpg',
    },
    {
      'title': 'Sepatu Gunung',
      'price': 'Rp 30.000',
      'image': 'assets/images/sepatu.jpg',
    },
    {
      'title': 'Sleeping Bag',
      'price': 'Rp 25.000',
      'image': 'assets/images/sleepingbag.jpg',
    },
    {
      'title': 'Tenda Kap. 4 Orang',
      'price': 'Rp 200.000',
      'image': 'assets/images/tenda2.jpg',
    },
  ];

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _dummyProductsTab.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final product = _dummyProductsTab[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    title: product['title']!,
                    price: product['price']!,
                    imagePath: product['image']!,
                  ),
                ),
              );
            },
            child: ProductCard(
              title: product['title']!,
              price: product['price']!,
              imagePath: product['image']!,
            ),
          );
        },
      ),
    );
  }
}
