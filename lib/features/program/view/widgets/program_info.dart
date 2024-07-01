import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class ProgramInfo extends ConsumerWidget {
  final ProgramModel program;
  const ProgramInfo({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Pallete.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                program.judul,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Pallete.greyColor,
                  size: 20,
                ),
                Text(
                  program.lokasi,
                  style: const TextStyle(
                    color: Pallete.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: program.idrJumlah,
                  style: const TextStyle(
                    color: Pallete.backgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(
                      text: "   terkumpul dari   ",
                      style: TextStyle(
                        color: Pallete.borderColor2,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: program.idrTarget,
                      style: const TextStyle(
                        color: Pallete.backgroundColor,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              minHeight: 10.0,
              value: program.jumlah / program.targetDana,
              semanticsLabel: "progress",
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Pallete.backgroundColor,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: program.donasi.toString(),
                  style: const TextStyle(
                    color: Pallete.backgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
                    TextSpan(
                      text: "  Donasi",
                      style: TextStyle(
                        color: Pallete.borderColor2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
