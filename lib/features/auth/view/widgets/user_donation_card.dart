import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/constants/server_constant.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/pages/detail_program_page.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDonationCard extends ConsumerWidget {
  final DonationModel data;
  const UserDonationCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        // color: Pallete.greyColor,
        border: Border(
          bottom: BorderSide(color: Pallete.greyColorMore, width: 2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.waktu,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(slugProgram.notifier)
                          .update((state) => data.programSlug);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailProgramPage(),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.program,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.idrJumlah,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl(
                    "${ServerConstant.serverURL}/donation/${data.id}/invoice");
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                // backgroundColor: Pallete.greenColor,
              ),
              child: const Column(
                children: [
                  Icon(Icons.download),
                  Text(
                    "Download",
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(uurrll) async {
    Uri url = Uri.parse(uurrll);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
