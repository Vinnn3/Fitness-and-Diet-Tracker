import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({super.key, 
    required this.controller,   // Ensure this is marked as required
    required this.labelText,
    required this.isPassword,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,   // Controller used here
      obscureText: isPassword, // Obscure the text if it's a password field
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null, // Add prefix icon if available
        border: const OutlineInputBorder(),
      ),
      validator: validator, // Use the validator function if available
    );
  }
}
