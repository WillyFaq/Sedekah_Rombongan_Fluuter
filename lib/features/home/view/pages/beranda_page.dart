import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/app_bar.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/catagory_list.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/footer.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/my_carousel.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/page_tittle.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/programlist_widget.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // AppBar
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: AppBarSR(),
          ),
          const PageTittle(titleText: "Penggalangan Dana Mendesak"),
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Pallete.whiteColor,
            ),
            child: const MyCarousel(),
          ),
          const PageTittle(titleText: "Pilih Kategori Program"),
          const CategoryList(),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Berikan Sedekah Terbaik!!!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                ProgramlistWidget(),
              ],
            ),
          ),
          Container(
            height: 20,
            decoration: const BoxDecoration(color: Pallete.base),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
