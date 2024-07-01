import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/pages/detail_program_page.dart';
import 'package:shimmer/shimmer.dart';

class MyCarousel extends ConsumerStatefulWidget {
  const MyCarousel({super.key});

  @override
  ConsumerState<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends ConsumerState<MyCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final listImage = ref.watch(getCarouselProvider);

    return listImage.when(
      data: (imgc) {
        return Stack(
          children: [
            CarouselSlider(
              items: imgc
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        ref
                            .read(slugProgram.notifier)
                            .update((state) => item.slug);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailProgramPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: item.gambar,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgc.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Colors.white).withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        );
      },
      error: (error, st) => errtext(error),
      loading: () => SizedBox(
        height: 180,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: const BoxDecoration(
              color: Pallete.greyColor,
            ),
          ),
        ),
      ),
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
}
