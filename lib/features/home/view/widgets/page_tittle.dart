import 'package:flutter/material.dart';

class PageTittle extends StatelessWidget {
  final String titleText;
  const PageTittle({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          titleText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
