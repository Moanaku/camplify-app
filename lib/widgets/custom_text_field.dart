import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? icon; // Icon jadi opsional
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines; // Untuk Alamat
  final bool isReadOnly; // Untuk Date Picker
  final VoidCallback? onTap; // Untuk aksi klik (Date Picker)
  
  // Untuk Dropdown
  final bool isDropdown;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isReadOnly = false,
    this.onTap,
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    const Color greenPrimary = Color(0xFF5B9E77);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700, // Lebih tebal sesuai desain baru
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400), // Border abu-abu
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: widget.isDropdown
                ? DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(widget.hint, style: TextStyle(color: Colors.grey[400])),
                      value: widget.controller?.text.isNotEmpty == true ? widget.controller?.text : null,
                      items: widget.dropdownItems?.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: widget.onDropdownChanged,
                    ),
                  )
                : TextField(
                    controller: widget.controller,
                    obscureText: widget.isPassword ? _obscureText : false,
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines,
                    readOnly: widget.isReadOnly,
                    onTap: widget.onTap,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      // Logic Icon: Tampilkan Icon kalau ada, kalau Password ada mata, Dropdown panah
                      prefixIcon: widget.icon != null ? Icon(widget.icon, color: greenPrimary) : null,
                      suffixIcon: widget.isPassword
                          ? IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}