import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? lines;
  final TextInputType? inpType;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.readOnly = false,
    this.onTap,
    this.lines = 1,
    this.inpType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      maxLines: lines,
      keyboardType: inpType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15),
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
      style: const TextStyle(fontSize: 12),
    );
  }
}
