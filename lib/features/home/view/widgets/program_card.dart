import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/pages/detail_program_page.dart';

class ProgramCard extends ConsumerWidget {
  final String image;
  final String slug;
  final String title;
  final String donation;
  final double progres;
  final int donasi;
  final List<String> listDonatur;

  const ProgramCard({
    super.key,
    required this.image,
    required this.slug,
    required this.title,
    required this.donation,
    required this.progres,
    this.donasi = 0,
    List<String>? donatur,
  }) : listDonatur = donatur ?? const [];
  // var list_donatur = this.donatur;
  // donatur!.add('${donasi.toString()}+');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // listDonatur.add('${donasi >= 100 ? '99' : donasi.toString()}+');
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(slugProgram.notifier).update((state) => slug);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailProgramPage(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Pallete.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  // child: Image.network(image),
                  child: CachedNetworkImage(
                    imageUrl: image,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: donation,
                              style: const TextStyle(
                                color: Pallete.backgroundColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                              children: const [
                                TextSpan(
                                  text: "   terkumpul",
                                  style: TextStyle(
                                    color: Pallete.borderColor2,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: progres,
                          semanticsLabel: "progress",
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          color: Pallete.backgroundColor,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 22,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listDonatur.length,
                              itemBuilder: (context, index) {
                                final d = listDonatur[index];
                                return Align(
                                  widthFactor: 0.55,
                                  child: Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Pallete.whiteColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Pallete.backgroundColor,
                                      radius: 15,
                                      child: Text(
                                        d,
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Pallete.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
/**
 * 
 * Text(
    "36+ Donasi",
    style: TextStyle(
      color: Pallete.backgroundColor,
      fontSize: 10,
    ),
  ),
 */