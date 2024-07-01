import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';

class AppBarSR extends ConsumerStatefulWidget {
  const AppBarSR({super.key});

  @override
  ConsumerState<AppBarSR> createState() => _AppBarSRState();
}

class _AppBarSRState extends ConsumerState<AppBarSR> {
  final cariController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String val = "";

  @override
  void dispose() {
    cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cariController.text = ref.watch(cariQuery);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/icon.png",
          width: 55,
        ),
        SizedBox(
          width: 270,
          height: 35,
          child: Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 235,
                  decoration: const BoxDecoration(
                    color: Pallete.backgroundColor2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  child: TextFormField(
                    controller: cariController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Pallete.backgroundColor2,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Pallete.backgroundColor2,
                          width: 3,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                      hintText: 'Cari yang ingin kamu bantu',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (cariController.text.trim() != "") {
                      ref.read(mainPageIndex.notifier).update((state) => 2);
                      ref
                          .read(cariQuery.notifier)
                          .update((state) => cariController.text);
                    }
                  },
                  child: Container(
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Pallete.backgroundColor3,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
