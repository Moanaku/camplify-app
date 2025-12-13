import 'package:flutter/material.dart';

// --- IMPORT FILE HALAMAN ---
// Gunakan relative path agar tidak error package name// Kita tambahkan folder 'splashscreen' ke dalam jalur import
import 'screens/splashscreen/splash_screen.dart';
import 'screens/welcome/role_selection_page.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/merchant/merchant_home.dart';
import 'screens/customer/customer_home.dart';
import 'screens/customer/profile_setup_page.dart';
import 'screens/customer/biodata_diri_page.dart';
import 'screens/customer/dokumen_pribadi_page.dart';
import 'screens/merchant/merchant_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camplify',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF5B9E77),
        scaffoldBackgroundColor: Colors.white,
      ),

      // PENTING: Set rute awal ke '/' (Splash Screen)
      initialRoute: '/',

      routes: {
        // Rute '/' akan memanggil SplashScreen
        '/': (context) => const SplashScreen(),

        // Rute '/role-selection' akan memanggil RoleSelectionPage
        '/role-selection': (context) => const RoleSelectionPage(),

        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile-setup': (context) => const ProfileSetupPage(),
        '/biodata-diri': (context) => const BiodataDiriPage(),
        '/dokumen-pribadi': (context) => const DokumenPribadiPage(),
        '/customer-home': (context) => const CustomerHomePage(),
        '/merchant-home': (context) => const MerchantHomePage(),
        '/register-merchant': (context) => const MerchantRegisterPage(),
      },
    );
  }
}