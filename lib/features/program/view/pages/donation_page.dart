import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sedekah_rombongan_flutter/core/models/user_model.dart';
import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/pages/thank_page.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/donation_input.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class DonationPage extends ConsumerStatefulWidget {
  const DonationPage({super.key});

  @override
  ConsumerState<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends ConsumerState<DonationPage> {
  final jumlahController = MoneyMaskedTextController(
    leftSymbol: 'Rp. ',
    thousandSeparator: ',',
    decimalSeparator: '',
    precision: 0,
  );
  final doaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool sedekaholic = false;

  void _changeInput(double val) {
    setState(() {
      jumlahController.updateValue(val);
    });
  }

  @override
  void initState() {
    super.initState();
    jumlahController.updateValue(100000);
  }

  @override
  void dispose() {
    super.dispose();
    jumlahController.dispose();
    doaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    String slug = ref.watch(slugProgram);
    final gdpp = ref.watch(getDetailProgramProvider(slug));

    //
    ref.listen(ayoDonasiProvider, (prev, next) {
      next?.when(
        data: (data) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ThankPage(
                idd: data.id,
                program: data.program,
                donatur: currentUser!.nama,
                donasi: data.idrJumlah,
              ),
            ),
            (_) => false,
          );
        },
        error: (error, stackTrace) {
          showSnackBar(context, error.toString());
        },
        loading: () {
          showSnackBar(context, "Sedang diproses");
        },
      );
    });
    //

    return SafeArea(
      child: gdpp.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  data.judul,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Pallete.whiteColor,
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.5),
              ),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      children: [
                        _programInfo(data),
                        const SizedBox(height: 40),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Donasi Terbaik Anda",
                          ),
                        ),
                        const SizedBox(height: 20),
                        DonationInput(
                          jmlController: jumlahController,
                          onChangeInput: _changeInput,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 40,
                          decoration:
                              const BoxDecoration(color: Pallete.bluewhite),
                        ),
                        const SizedBox(height: 20),
                        //
                        _donaturInfo(currentUser!),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sembunyikan nama saya (Sedekaholic)",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Switch(
                              activeColor: Pallete.greenColor,
                              splashRadius: 50.0,
                              value: sedekaholic,
                              onChanged: (val) {
                                setState(() {
                                  sedekaholic = val;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          maxLines: 4,
                          controller: doaController,
                          decoration: const InputDecoration(
                            hintText:
                                "Tuliskan pesan atau doa disini (optional)",
                            contentPadding: EdgeInsets.all(15),
                          ),
                          validator: (val) {
                            return null;
                          },
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: Pallete.whiteColor,
                height: 68,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 6,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("OKED");
                          int projectId = data.id;
                          int jumlah = jumlahController.numberValue.toInt();
                          String user = currentUser.token;
                          ref.read(ayoDonasiProvider.notifier).goDonasi(
                                projectId: projectId,
                                jumlah: jumlah,
                                anonim: sedekaholic,
                                token: user,
                                doa: doaController.text,
                              );
                        } else {
                          showSnackBar(context, 'Missing fields!');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Pallete.greenColor),
                      child: Text(
                        "Donasi - ${jumlahController.text}",
                        style: const TextStyle(
                          color: Pallete.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return _errorWidget();
        },
        loading: () {
          return const Loader();
        },
      ),
    );
  }

  Widget _programInfo(data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: CachedNetworkImage(
            imageUrl: data.gambar,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Anda akan berdonasi dalam program:",
                    style: TextStyle(
                      color: Pallete.greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.judul,
                    style: const TextStyle(
                      color: Pallete.backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _errorWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset("assets/anim/error.json"),
        ],
      ),
    );
  }

  Widget _donaturInfo(UserModel user) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Donatur : ",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.nama,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${user.email} - ${user.nomorTelepon}",
            style: const TextStyle(
              fontSize: 14,
              color: Pallete.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
