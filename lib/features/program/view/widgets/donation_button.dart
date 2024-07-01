import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class DonationButton extends StatelessWidget {
  final VoidCallback onTap;
  const DonationButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Pallete.greenColor),
      child: const Text(
        "Donasi Sekarang!",
        style: TextStyle(
          color: Pallete.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
