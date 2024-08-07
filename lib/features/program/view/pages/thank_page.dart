import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/constants/server_constant.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ThankPage extends ConsumerWidget {
  final int idd;
  final String program;
  final String donatur;
  final String donasi;
  const ThankPage({
    super.key,
    required this.idd,
    required this.program,
    required this.donatur,
    required this.donasi,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (r) => false,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/icon.png",
                      width: 140,
                      height: 140,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Text(
                  //   'Terimakasih $donatur Atas Donasi yang anda berikan pada program : ',
                  // ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Terimakasih ",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: donatur,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              " Atas Donasi yang anda berikan pada program : ",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    program,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      border: Border.all(
                        color: Pallete.greyColorMore,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            child: Image.asset(
                              "assets/images/donationbag.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            donasi,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Pallete.transparentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                backgroundColor: Pallete.whiteColor,
                              ),
                              label: const Text(
                                "copy",
                                style: TextStyle(
                                  color: Pallete.greyColor,
                                ),
                              ),
                              icon: const Icon(
                                Icons.copy,
                                color: Pallete.greyColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  keInvoice(),
                  // keHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget keHome() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Pallete.facebook),
      child: const Text(
        "Kembali",
        style: TextStyle(
          color: Pallete.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget keInvoice() {
    return ElevatedButton(
      onPressed: () {
        _launchUrl("${ServerConstant.serverURL}/donation/$idd/invoice");
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Pallete.greenColor),
      child: const Text(
        "Donwload Bukti Donasi",
        style: TextStyle(
          color: Pallete.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
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
