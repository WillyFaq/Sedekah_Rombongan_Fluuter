import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/features/auth/repositories/intro_repository.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';
// import 'package:sedekah_rombongan_flutter/features/program/view/pages/detail_program_page.dart';
// import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
// import 'package:sedekah_rombongan_flutter/features/home/view/pages/test_program_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/home_page.dart';
import 'package:sedekah_rombongan_flutter/features/introduction/view/pages/introduction_screens.dart';
import 'package:sedekah_rombongan_flutter/features/introduction/viewmodel/intro_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SplashScreen(),
    ),
  );
  await container.read(authViewmodelProvider.notifier).initSharedPreferences();
  await container.read(introViewmodelProvider.notifier).initSharedPreferences();
  await container.read(authViewmodelProvider.notifier).getData();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentUser = ref.watch(currentUserNotifierProvider);
    final isIntro = ref.watch(introRepositoryProvider);
    print(isIntro.isIntro());
    return MaterialApp(
      title: 'Sedekah Rombongan',
      theme: AppTheme.lightThemeMode,
      home: SafeArea(
        child: isIntro.isIntro() == null
            ? const IntroductionScreens()
            : const HomePage(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sedekah Rombongan',
      theme: AppTheme.lightThemeMode,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/icon.png"),
              const Text("YUK BERDONASI UNUTK MEMBANTU SAUDARA KITA!"),
              const SizedBox(height: 40),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}

//dart run build_runner watch -d