import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/login_page.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/profil_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/about_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/beranda_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/program_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int selectedIndex = 0;

  final pages = const [
    BerandaPage(),
    AboutPage(),
    ProgramPage(),
    ProfilPage(), // profile page
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    selectedIndex = ref.watch(mainPageIndex);
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: StyleProvider(
        style: BnbStyle(),
        child: ConvexAppBar(
          backgroundColor: Pallete.whiteColor,
          color: Pallete.backgroundColor3,
          activeColor: Pallete.backgroundColor3,
          style: TabStyle.fixed,
          onTap: (int i) => onTabNavBottom(i, currentUser),
          items: [
            const TabItem(icon: Icons.home, title: "Beranda"),
            const TabItem(icon: Icons.badge, title: "Tentang SR"),
            TabItem(
                icon: Lottie.asset("assets/anim/srheart.json"),
                title: "Yuk Sedekah"),
            const TabItem(
                icon: FaIcon(FontAwesomeIcons.whatsapp), title: "WA Admin SR"),
            const TabItem(icon: Icons.person, title: "Profile"),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    Uri url = Uri.parse('https://wa.me/6281296690808');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void onTabNavBottom(i, currentUser) {
    {
      if (i <= 2) {
        ref.read(mainPageIndex.notifier).update((state) => i);
        ref.read(categoryForProgram.notifier).update((state) => 0);
        ref.read(cariQuery.notifier).update((state) => "");
      } else if (i == 3) {
        _launchUrl();
      } else if (i == 4) {
        if (currentUser == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          ref.read(mainPageIndex.notifier).update((state) => 3);
        }
      }
    }
  }
}

class BnbStyle extends StyleHook {
  @override
  double get activeIconSize => 60;

  @override
  double get activeIconMargin => 1;

  @override
  double get iconSize => 30;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 9, color: color);
  }
}
