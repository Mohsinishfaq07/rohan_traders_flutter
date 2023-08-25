import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class UremitRouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.splashPageConfig);
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case PagePaths.splashPagePath:
        return SynchronousFuture(PageConfigs.splashPageConfig);
      default:
        return SynchronousFuture(PageConfigs.splashPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);
      case Pages.dashboardScreen:
        return const RouteInformation(location: PagePaths.dashboardPagePath);
      case Pages.hozriScreen:
        return const RouteInformation(location: PagePaths.hozriScreenPagePath);
      case Pages.perfumeScreen:
        return const RouteInformation(
            location: PagePaths.perfumeScreenPagePath);
      case Pages.bottomNavigationBar:
        return const RouteInformation(
            location: PagePaths.bottomNavigationBarPagePath);
      case Pages.shoppingCartScreen:
        return const RouteInformation(
            location: PagePaths.shoppingCartScreenPagePath);

      case Pages.editProfileScreen:
        return const RouteInformation(
            location: PagePaths.editProfileScreenPagePath);
      case Pages.allCategoryScreen:
        return const RouteInformation(
            location: PagePaths.allCategoryScreenPagePath);
      case Pages.signUpScreen:
        return const RouteInformation(location: PagePaths.signUpScreenPagePath);
      case Pages.loginScreen:
        return const RouteInformation(location: PagePaths.loginScreenPagePath);
      case Pages.postPage:
        return const RouteInformation(location: PagePaths.postPagePath);
        case Pages.historyScreen:
        return const RouteInformation(location: PagePaths.historyScreenPagePath);
        case Pages.productPage:
        return const RouteInformation(location: PagePaths.productPagePath);
        case Pages.phoneScreen:
        return const RouteInformation(location: PagePaths.phoneScreenPagePath);
        case Pages.otpScreen:
        return const RouteInformation(location: PagePaths.otpScreenPagePath);
        case Pages.myFavouriteScreen:
        return const RouteInformation(location: PagePaths.myFavouriteScreenPagePath);
    }
  }
}
