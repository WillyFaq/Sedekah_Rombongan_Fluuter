import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onTap;
  const ShareButton({
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
          side: const BorderSide(color: Pallete.facebook),
        ),
        backgroundColor: Pallete.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.share,
            color: Pallete.facebook,
          ),
          const SizedBox(width: 10),
          RichText(
            text: const TextSpan(
              text: "Share\n",
              style: TextStyle(
                color: Pallete.facebook,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "Bagikan",
                  style: TextStyle(
                    color: Pallete.facebook,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
