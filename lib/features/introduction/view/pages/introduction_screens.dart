import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/login_page.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Profil Sedekah Rombongan',
            body:
                '#SedekahRombongan adalah menyampaikan titipan langit tanpa rumit, sulit, dan berbelit-belit. Sedangkan misinya adalah pertama, mengajak semua kalangan masyarakat untuk Bersama-sama merutinkan sedekah dengan mengedukasi tentang Gerakan Sedekah Rombongan. Kedua, menyampaikan dana sedekah tepat sasaran kepada dhuafa yang membutuhkan, mendampingi yang sakit tanpa prosedur yang rumit. Dan ketiga, melaporkan semua santunan yang sudah diberikan dengan rapi dan akuntable untuk menjaga kepercayaan masyarakat.',
            image: buildImage("assets/images/icon.png"),
            // image: const Image(image: AssetImage('assets/images/icon.png')),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Layanan Sedekah Rombongan',
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kurir #SedekahRombongan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "#SedekahRombongan pada dasarnya merupakan kesatuan para kurir. Saat ini ada ratusan kurir #SedekahRombongan yang tersebar di seluruh Indonesia. Mereka bergerak tanpa ekspos media dan bekerja dengan prinsip yang sama, yaitu membantu orang lain yang membutuhkan agar bisa cari muka di depan tuhan.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            image: Lottie.asset("assets/anim/courier.json"),
            // image: const Image(image: AssetImage('assets/images/icon.png')),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Layanan Sedekah Rombongan',
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rumah Singgah #SedekahRombongan (#RSSR)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "#RSSR atau Rumah Singgah #SedekahRombongan merupakan rumah bersama yang dipergunakan untuk singgah dan/atau tinggal sementara bagi para pasien dampingan #SedekahRombongan. #SedekahRombongan kini memiliki 14 rumah singgah yang tersebar di 13 kota di seluruh Indonesia.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            image: Lottie.asset("assets/anim/house.json"),
            // image: const Image(image: AssetImage('assets/images/icon.png')),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Layanan Sedekah Rombongan',
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mobil Tanggap #SedekahRombongan (#MTSR)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "#SedekahRombongan memiiki kendaraan operasional yang siap siaga mensupport segala kegiatannya, yang biasa disebut #MTSR. #SedekahRombongan memiliki sembilan belas mobil tanggap yang tersebar di seluruh Indonesia yang siap melayani masyarakat dan kaum dhuafa.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            image: Lottie.asset("assets/anim/ambulance.json"),
            // image: const Image(image: AssetImage('assets/images/icon.png')),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          if (kDebugMode) {
            print("Done Clicked");
          }
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => const LoginPage()),
          //   (Route<dynamic> route) => false,
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        scrollPhysics: const ClampingScrollPhysics(),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: const Text("Skip",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )),
        next: const Text("Next",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Pallete.mainColor,
            )),
        done: const Text("Done",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Pallete.mainColor,
            )),
        dotsDecorator: getDotsDecorator(),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return Center(
      child: Image.asset(
        imagePath,
        width: 192,
        height: 192,
      ),
    );
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 20),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 20),
      bodyTextStyle: TextStyle(color: Colors.black, fontSize: 15),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Pallete.mainColor,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
