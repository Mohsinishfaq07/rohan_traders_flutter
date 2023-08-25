import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class SplashServices {
  void isLogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Future.delayed(const Duration(seconds: 2), () {
        AppState appState = sl();
        appState.goToNext(PageConfigs.bottomNavigationBarPageConfig);
      });
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        AppState appState = sl();
        appState.goToNext(PageConfigs.logInScreenPageConfig);
      });
    }
  }
}
