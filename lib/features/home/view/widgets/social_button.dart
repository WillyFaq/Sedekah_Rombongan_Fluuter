import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class SocialButton extends StatelessWidget {
  final Color bgcolor;
  final Widget btnIcon;
  final VoidCallback onClick;
  const SocialButton({
    super.key,
    required this.bgcolor,
    required this.btnIcon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Center(
        child: IconButton(
          onPressed: onClick,
          icon: btnIcon,
          color: Pallete.whiteColor,
          iconSize: 15,
        ),
      ),
    );
  }
}
