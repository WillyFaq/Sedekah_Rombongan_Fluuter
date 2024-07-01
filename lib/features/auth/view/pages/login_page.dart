import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/custom_field.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/register_page.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/home_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (_) => false,
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
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/icon.png",
                        width: 140,
                        height: 140,
                      ),
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    AuthGradientButton(
                      buttonText: 'Login',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(authViewmodelProvider.notifier)
                              .loginUser(
                                email: emailController.text,
                                password: passwordController.text,
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
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Belum Punya Akun? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: const [
                              TextSpan(
                                text: "Daftar Sekarang",
                                style: TextStyle(
                                  color: Pallete.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
