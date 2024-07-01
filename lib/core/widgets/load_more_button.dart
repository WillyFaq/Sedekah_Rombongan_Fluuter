import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoadMoreButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Pallete.btngreen,
          )),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: const Text(
          "Load more",
          style: TextStyle(
            color: Pallete.btngreen,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
