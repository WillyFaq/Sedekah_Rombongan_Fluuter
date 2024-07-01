import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/models/comment_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';

class CommentCard extends ConsumerWidget {
  final CommentModel data;
  const CommentCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Pallete.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.user,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.waktu,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(data.isiKomentar),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(aminCommentProvider.notifier)
                        .aminn(id: data.id.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Pallete.transparentColor,
                    minimumSize: Size.zero, // Set this
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    backgroundColor: Pallete.whiteColor,
                  ),
                  child: SizedBox(
                    width: 136,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 23,
                          child:
                              Image.asset("assets/images/praying-color3.png"),
                        ),
                        const SizedBox(width: 10),
                        amintext(data.amin),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget amintext(int amin) {
    if (amin == 0) {
      return const Text(
        "Aaminn-kan doa ini",
        style: TextStyle(
          fontSize: 13,
        ),
      );
    }
    return Text(
      "${amin.toString()} Aaminn",
      style: const TextStyle(
        fontSize: 13,
        color: Pallete.mainColor,
      ),
    );
  }
}
