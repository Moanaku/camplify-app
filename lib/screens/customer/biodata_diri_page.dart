import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/common_footer.dart';
import '../../widgets/upload_placeholder.dart'; // Import widget baru

class BiodataDiriPage extends StatefulWidget {
  const BiodataDiriPage({super.key});

  @override
  State<BiodataDiriPage> createState() => _BiodataDiriPageState();
}

class _BiodataDiriPageState extends State<BiodataDiriPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color greenDarkBtn = Color(0xFF1E6F5C);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Biodata Diri",
          style: TextStyle(color: Colors.black),
        ),
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
                  // Widget Upload Foto
                  const UploadPlaceholder(
                    label: "Foto Profil",
                    placeholderText: "Pilih Foto disini (jpg,jpg,png)",
                  ),

                  const CustomTextField(label: "Nama", hint: "Masukkan Nama"),

                  CustomTextField(
                    label: "Tanggal Lahir",
                    hint: "Masukkan Tanggal Lahir",
                    controller: _dateController,
                    isReadOnly: true,
                    onTap: () => _selectDate(context),
                  ),

                  CustomTextField(
                    label: "Jenis Kelamin",
                    hint: "P",
                    controller: _genderController,
                    isDropdown: true,
                    dropdownItems: const ['P', 'L'],
                    onDropdownChanged: (val) =>
                        setState(() => _genderController.text = val!),
                  ),

                  const CustomTextField(
                    label: "Alamat",
                    hint: "Masukkan Alamat",
                    maxLines: 4,
                  ),

                  // Header Kontak
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "KONTAK",
                      style: TextStyle(
                        color: greenDarkBtn,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const CustomTextField(
                    label: "Nomor HP",
                    hint: "Masukkan Nomor HP",
                    keyboardType: TextInputType.phone,
                  ),
                  const CustomTextField(
                    label: "Email",
                    hint: "Masukkan Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const CustomTextField(
                    label: "Password",
                    hint: "Masukkan Password",
                    isPassword: true,
                  ),
                  const CustomTextField(
                    label: "Konfirmasi Password",
                    hint: "Ulangi Password",
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),

                  // Tombol Konfirmasi
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pop(context), // Kembali ke menu
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenDarkBtn,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "Konfirmasi",
                            style: TextStyle(color: Colors.white),
                          ),
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
                          child: const Text(
                            "Batal",
                            style: TextStyle(color: Colors.white),
                          ),
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
