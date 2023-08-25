import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);
  static PageConfiguration dashboardPageConfig = const PageConfiguration(
      key: PageKeys.dashboardPageKey,
      path: PagePaths.dashboardPagePath,
      uiPage: Pages.dashboardScreen);
  static PageConfiguration hozriPageConfig = const PageConfiguration(
      key: PageKeys.hozriScreenPageKey,
      path: PagePaths.hozriScreenPagePath,
      uiPage: Pages.hozriScreen);
      static PageConfiguration perfumePageConfig = const PageConfiguration(
      key: PageKeys.perfumeScreenPageKey,
      path: PagePaths.perfumeScreenPagePath,
      uiPage: Pages.perfumeScreen);
      static PageConfiguration bottomNavigationBarPageConfig = const PageConfiguration(
      key: PageKeys.bottomNavigationBarPageKey,
      path: PagePaths.bottomNavigationBarPagePath,
      uiPage: Pages.bottomNavigationBar);
      static PageConfiguration shoppingCartScreenPageConfig = const PageConfiguration(
      key: PageKeys.shoppingCartScreenPageKey,
      path: PagePaths.shoppingCartScreenPagePath,
      uiPage: Pages.shoppingCartScreen);
      static PageConfiguration editProfileScreenPageConfig = const PageConfiguration(
      key: PageKeys.editProfileScreenPageKey,
      path: PagePaths.editProfileScreenPagePath,
      uiPage: Pages.editProfileScreen);
      static PageConfiguration allCategoryScreenPageConfig = const PageConfiguration(
      key: PageKeys.allCategoryScreenPageKey,
      path: PagePaths.allCategoryScreenPagePath,
      uiPage: Pages.allCategoryScreen);
      static PageConfiguration signUpScreenPageConfig = const PageConfiguration(
      key: PageKeys.signUpScreenPageKey,
      path: PagePaths.signUpScreenPagePath,
      uiPage: Pages.signUpScreen);
      static PageConfiguration logInScreenPageConfig = const PageConfiguration(
      key: PageKeys.loginScreenPageKey,
      path: PagePaths.loginScreenPagePath,
      uiPage: Pages.loginScreen);
      static PageConfiguration postPageConfig = const PageConfiguration(
      key: PageKeys.postPageKey,
      path: PagePaths.postPagePath,
      uiPage: Pages.postPage);
      static PageConfiguration historyScreenPageConfig = const PageConfiguration(
      key: PageKeys.historyScreenPageKey,
      path: PagePaths.historyScreenPagePath,
      uiPage: Pages.historyScreen);
      static PageConfiguration productPageConfig = const PageConfiguration(
      key: PageKeys.productPageKey,
      path: PagePaths.productPagePath,
      uiPage: Pages.productPage);
      static PageConfiguration phoneScreenPageConfig = const PageConfiguration(
      key: PageKeys.phoneScreenPageKey,
      path: PagePaths.phoneScreenPagePath,
      uiPage: Pages.phoneScreen);
      static PageConfiguration otpScreenPageConfig = const PageConfiguration(
      key: PageKeys.otpScreenPageKey,
      path: PagePaths.otpScreenPagePath,
      uiPage: Pages.otpScreen);
      static PageConfiguration myFavouriteScreenPageConfig = const PageConfiguration(
      key: PageKeys.myFavouriteScreenPageKey,
      path: PagePaths.myFavouriteScreenPagePath,
      uiPage: Pages.myFavouriteScreen);
}
