import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/custom_field.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/login_page.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final notelpController = MaskedTextController(mask: '+6200-000-000-000-000');
  final alamatController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    notelpController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(authViewmodelProvider.select((val) => val?.isLoading == true));

    ref.listen(
      authViewmodelProvider,
      (_, next) {
        next?.when(
          data: (data) {
            showSnackBar(
              context,
              'Account created successfully! Please  login.',
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          error: (error, st) {
            showSnackBar(context, error.toString());
          },
          loading: () {},
        );
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15.0,
                  bottom: 40.0,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/icon.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomField(
                        hintText: 'Nama',
                        controller: namaController,
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: 'Password',
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      const SizedBox(height: 15),
                      // CustomField(
                      //   hintText: 'Nomor Telpon',
                      //   controller: notelpController,
                      // ),
                      TextFormField(
                        controller: notelpController,
                        decoration: const InputDecoration(
                          hintText: "Nomor Telpon",
                          contentPadding: EdgeInsets.all(15),
                        ),
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return "Nomor Telpon is missing!";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 15),
                      CustomField(
                        hintText: 'Alamat',
                        controller: alamatController,
                        lines: 4,
                      ),
                      const SizedBox(height: 20),
                      AuthGradientButton(
                        buttonText: 'Register',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(authViewmodelProvider.notifier)
                                .signUpUser(
                                  name: namaController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  nomorTelepon: notelpController.text,
                                  alamat: alamatController.text,
                                );
                          } else {
                            showSnackBar(context, 'Missing fields!');
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Sudah Punya Akun? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: const [
                              TextSpan(
                                text: "Login Sekarang",
                                style: TextStyle(
                                  color: Pallete.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
