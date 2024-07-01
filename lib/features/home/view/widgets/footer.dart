import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // height: 250,
        decoration: const BoxDecoration(
          color: Pallete.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/images/logo-sr-semut.png",
                width: 200,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jl. Wonosari Km. 7 Mantup, \nRT 12, Mantup, Baturetno, Kec. Banguntapan \nKabupaten Bantul, Daerah Istimewa Yogyakarta, 55197",
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SocialButton(
                  bgcolor: Pallete.backgroundColor,
                  btnIcon: const FaIcon(FontAwesomeIcons.instagram),
                  onClick: () {
                    _launchUrl("https://www.instagram.com/srupdate");
                  },
                ),
                SocialButton(
                  bgcolor: Pallete.facebook,
                  btnIcon: const FaIcon(FontAwesomeIcons.facebook),
                  onClick: () {
                    _launchUrl("https://www.facebook.com/sedekahrombongan/");
                  },
                ),
                SocialButton(
                  bgcolor: Pallete.twitter,
                  btnIcon: const FaIcon(FontAwesomeIcons.twitter),
                  onClick: () {
                    _launchUrl("https://twitter.com/SRbergerak");
                  },
                ),
                SocialButton(
                  bgcolor: Pallete.youtube,
                  btnIcon: const FaIcon(FontAwesomeIcons.youtube),
                  onClick: () {
                    _launchUrl(
                        "https://www.youtube.com/channel/UCEyShN7JkXWOw2rNyHVvtdA");
                  },
                ),
              ],
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
