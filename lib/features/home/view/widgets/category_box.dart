import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';

class CategoryBox extends ConsumerWidget {
  final String titleText;
  final String imagePath;
  final int idk;

  const CategoryBox({
    super.key,
    required this.titleText,
    required this.imagePath,
    required this.idk,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(mainPageIndex.notifier).update((state) => 2);
        ref.read(categoryForProgram.notifier).update((state) => idk);
      },
      child: SizedBox(
        width: 80,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 10),
            Text(
              titleText,
              style: const TextStyle(
                fontSize: 10,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
