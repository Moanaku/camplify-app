import 'package:flutter/material.dart';

class UploadPlaceholder extends StatelessWidget {
  final String label;
  final String placeholderText;

  const UploadPlaceholder({
    super.key,
    required this.label,
    required this.placeholderText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            // Simulasi dashed border dengan border abu-abu
            border: Border.all(color: Colors.grey.shade400), 
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, color: Colors.grey.shade400),
                const SizedBox(height: 4),
                Text(
                  placeholderText,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}