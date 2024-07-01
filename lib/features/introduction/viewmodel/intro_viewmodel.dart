import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sedekah_rombongan_flutter/features/auth/repositories/intro_repository.dart';

part 'intro_viewmodel.g.dart';

@riverpod
class IntroViewmodel extends _$IntroViewmodel {
  late IntroRepository _introRepository;

  @override
  AsyncValue<bool>? build() {
    _introRepository = ref.watch(introRepositoryProvider);
    // _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    // _currentUserNotifier = ref.watch(currentUserNotifierProvider.notifier);
    return null;
  }

  Future<void> initSharedPreferences() async {
    await _introRepository.init();
  }

  bool? isIntro() {
    return _introRepository.isIntro();
  }

  void setIntro(bool val) {
    _introRepository.setIntro(val);
  }
}
