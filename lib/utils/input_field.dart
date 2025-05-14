import 'package:flutter/material.dart';
import 'package:pretium_app/utils/colors.dart';

class InputField extends StatelessWidget {
  final bool isObscure;
  final String labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const InputField({super.key, required this.labelText, this.prefixIcon, this.suffixIcon, this.validator, required this.controller, this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: AppColors.primaryColor, width: 1)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        validator: validator
      ),
    );
  }
}
