import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/widgets/profile_accrodion.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends ConsumerWidget {
  const ProfilPage({super.key});

  void logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // late UserModel currentUser;
    final token =
        ref.watch(currentUserNotifierProvider.select((user) => user!.token));
    // print(cu);
    final ci = ref.watch(getCurUserProvider(token));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Pallete.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Pallete.mainColor,
        actions: [
          PopupMenuButton(
            onSelected: (String value) {
              switch (value) {
                case "Ubah Profil":
                  showSnackBar(context, "Comming Soon!");
                  break;
                case "Logout":
                  logOut();
                  ref.invalidate(currentUserNotifierProvider);
                  ref.read(mainPageIndex.notifier).update((state) => 0);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Ubah Profil', 'Logout'}.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
        actionsIconTheme: const IconThemeData(
          color: Pallete.whiteColor,
        ),
      ),
      body: ci.when(
        data: (currentUser) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Pallete.greyColorMore,
                    radius: 50.0,
                    child: Icon(
                      Icons.person,
                      color: Pallete.whiteColor,
                      size: 80.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  Text(
                    currentUser.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentUser.email,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _genCard(
                    currentUser.idrTotalDonasi,
                    currentUser.jumlahDonasi.toString(),
                  ),
                  const SizedBox(height: 40),
                  _genField("Nomor Telepon", currentUser.nomorTelepon),
                  const SizedBox(height: 20),
                  _genField("Alamat", currentUser.alamat),
                  const SizedBox(height: 40),
                  ProfileAccrodion(currentUser: currentUser),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => _showError(error.toString()),
        loading: () => const Loader(),
      ),
    );
  }

  Widget _genCard(idrTotalDonasi, jumlahDonasi) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              decoration: BoxDecoration(
                color: Pallete.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(4),
                border: const Border(
                  bottom: BorderSide(
                    color: Pallete.pink,
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Pallete.softPink,
                      child: Icon(
                        Icons.favorite,
                        color: Pallete.pink,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Total Donasi"),
                    const SizedBox(height: 4),
                    Text(
                      idrTotalDonasi,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              decoration: BoxDecoration(
                color: Pallete.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(4),
                border: const Border(
                  bottom: BorderSide(
                    color: Pallete.blu,
                    width: 4,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Pallete.softBlu,
                      child: Icon(
                        Icons.thumb_up,
                        color: Pallete.blu,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Jumlah Donasi"),
                    const SizedBox(height: 4),
                    Text(
                      jumlahDonasi,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _genField(String label, String val) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              color: Pallete.greyColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            val,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showError(msg) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset("assets/anim/error.json"),
          Center(
            child: Text(msg),
          ),
        ],
      ),
    );
  }
}
