import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'intro_repository.g.dart';

@Riverpod(keepAlive: true)
IntroRepository introRepository(IntroRepositoryRef ref) {
  return IntroRepository();
}

class IntroRepository {
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setIntro(bool? isIntro) {
    if (isIntro != null) {
      _sharedPreferences.setBool("intro", isIntro);
    }
  }

  bool? isIntro() {
    return _sharedPreferences.getBool('intro');
  }
}
