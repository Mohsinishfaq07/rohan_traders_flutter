import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/utils/extension/extensions.dart';
import 'package:sb_myreports/features/authentication/sign-up/presentation/pages/phone_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/bottom_navigation_bar_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/favourite_Screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/get_post_page.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/history_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/hozri_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/perfumes.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/product_page.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/edit_profile_screen.dart';
import '../../features/authentication/login/presentation/pages/login_screen.dart';
import '../../features/authentication/sign-up/presentation/pages/otp_screen.dart';
import '../../features/authentication/sign-up/presentation/pages/sign-up-screen.dart';
import '../../features/dashboard/presentation/pages/all_category.dart';
import '../../features/dashboard/presentation/pages/shopping_cart_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../utils/enums/page_state_enum.dart';
import '../utils/globals/globals.dart';
import 'app_state.dart';
import 'pages.dart';

BuildContext?
    globalHomeContext; // doing this to pop the bottom sheet on home screen

class UremitRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final AppState appState;
  final List<Page> _pages = [];
  late BackButtonDispatcher backButtonDispatcher;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  UremitRouterDelegate(this.appState) {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Faulty Code will need to find a way to solve it
    appState.globalErrorShow = (value) {
      context.show(message: value);
    };

    return Container(
      key: ValueKey(pages.last.name),
      child: Navigator(
        key: navigatorKeyGlobal,
        onPopPage: _onPopPage,
        pages: buildPages(),
      ),
    );
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        addPage(appState.currentAction.page!);
        break;
      case PageState.remove:
        removePage(appState.currentAction.page!);
        break;

      case PageState.pop:
        pop();
        break;
      case PageState.addAll:
        // TODO: Handle this case.
        break;
      case PageState.addWidget:
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.replace:
        replace(appState.currentAction.page!);
        break;
      case PageState.replaceAll:
        replaceAll(appState.currentAction.page!);
        break;
    }
    return List.of(_pages);
  }


  void replaceAll(PageConfiguration newRoute) {
    _pages.clear();
    setNewRoutePath(newRoute);
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }



  /// This method adds pages based on the PageConfig received
  /// [Input]: [PageConfiguration]
  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != pageConfig.path);

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splashPage:
          _addPageData(const SplashScreen(), pageConfig);
          break;
          case Pages.dashboardScreen:
          _addPageData( DashboardScreen(), pageConfig);
          break;
          case Pages.hozriScreen:
          _addPageData( HozriScreen(), pageConfig);
          break; case Pages.perfumeScreen:
          _addPageData( PerfumeScreen(), pageConfig);
          break;
          case Pages.bottomNavigationBar:
          _addPageData( const BottomNavigationBarScreen(),pageConfig);
          break;
          case Pages.shoppingCartScreen:
          _addPageData( const ShoppingCartScreen(),pageConfig);
          break;
          case Pages.editProfileScreen:
          _addPageData( const EditProfileScreen(),pageConfig);
          break;
          case Pages.allCategoryScreen:
          _addPageData( const AllCategoryScreen(),pageConfig);
          break;
          case Pages.signUpScreen:
          _addPageData( const SignUpScreen(),pageConfig);
          break;
          case Pages.loginScreen:
          _addPageData( const LoginScreen(),pageConfig);
          break;
          case Pages.postPage:
          _addPageData( const PostPage(),pageConfig);
          break;
          case Pages.historyScreen:
          _addPageData( const HistoryScreen(),pageConfig);
          break;
          case Pages.productPage:
          _addPageData(  ProductPage(),pageConfig);
          break;
          case Pages.phoneScreen:
          _addPageData(  const PhoneScreen(),pageConfig);
          break;
          case Pages.otpScreen:
          _addPageData(   OtpScreen(),pageConfig);
          break;
          case Pages.myFavouriteScreen:
          _addPageData( const FavouriteScreen(),pageConfig);
          break;
      }
    }
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }
  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (globalHomeContext != null) {
      Navigator.of(globalHomeContext!).pop();
      globalHomeContext = null;
      return;
    }
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    } else {
      // if (_pages.last.name != PagePaths.authWrapperPagePath) {
      //   _homeViewModel.onBottomNavTap(0);
      // }
    }
  }
  void removePage(PageConfiguration page) {
    if (_pages.isNotEmpty) {
      int index = _pages.indexWhere((element) => element.name == page.path);
      if (index != -1) {
        _pages.removeAt(index);
      }
    }
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
    // notifyListeners();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != configuration.path);

    if (!shouldAddPage) {
      return SynchronousFuture(null);
    }
    _pages.clear();
    addPage(configuration);

    return SynchronousFuture(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigatorKeyGlobal;
}
