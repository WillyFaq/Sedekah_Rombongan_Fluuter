import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';
// import 'package:sedekah_rombongan_flutter/features/program/view/pages/detail_program_page.dart';
// import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
// import 'package:sedekah_rombongan_flutter/features/home/view/pages/test_program_page.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewmodelProvider.notifier).initSharedPreferences();
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
    return MaterialApp(
      title: 'Sedekah Rombongan',
      theme: AppTheme.lightThemeMode,
      home: const SafeArea(
        child: HomePage(),
      ),
    );
  }
}


//dart run build_runner watch -d