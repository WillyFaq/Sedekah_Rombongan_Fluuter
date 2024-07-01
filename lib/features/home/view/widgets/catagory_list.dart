import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/category_box.dart';
import 'package:shimmer/shimmer.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  List<Widget> buildCategoryBox(data) {
    // return data.map((kat) => Text(kat["nama_kategori"])) as List<Widget>;
    List<String> imgpath = [
      "",
      "assets/images/Bencana.jpg",
      "assets/images/MTSR.jpg",
      "assets/images/RSSR.jpg",
      "assets/images/Pendampingan.jpg",
    ];
    List<Widget> wkat = [];
    for (final map in data) {
      wkat.add(
        CategoryBox(
            titleText: map["nama_kategori"],
            imagePath: imgpath[map["id"]],
            idk: map["id"]),
      );
    }
    return wkat;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCategory = ref.watch(getCategoriesProvider);

    return listCategory.when(
      data: (data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildCategoryBox(data),
        );
      },
      error: (error, st) => errtext(error),
      loading: () => _shimmerLoading(),
    );
  }

  Widget errtext(errmsg) {
    return Column(
      children: [
        const Text(
          "Terjadi Kesalahan!",
          style: TextStyle(
            color: Pallete.mainColor,
          ),
        ),
        Text(errmsg.toString()),
      ],
    );
  }

  Widget _shimmerLoading() {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryBox(
                titleText: "Placeholder title Text",
                imagePath: "assets/images/Bencana.jpg",
                idk: 1),
            CategoryBox(
                titleText: "Placeholder title Text",
                imagePath: "assets/images/Bencana.jpg",
                idk: 1),
            CategoryBox(
                titleText: "Placeholder title Text",
                imagePath: "assets/images/Bencana.jpg",
                idk: 1),
            CategoryBox(
                titleText: "Placeholder title Text",
                imagePath: "assets/images/Bencana.jpg",
                idk: 1),
          ],
        ),
      ),
    );
  }
}
