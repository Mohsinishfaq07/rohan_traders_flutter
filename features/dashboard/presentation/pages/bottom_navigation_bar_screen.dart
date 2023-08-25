import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/all_category.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/perfumes.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/shopping_cart_screen.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../widgets/custom_drawer_widget.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarContent();
  }
}

class BottomNavigationBarContent extends StatefulWidget {
  const BottomNavigationBarContent({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarContent> createState() =>
      _BottomNavigationBarContentState();
}

class _BottomNavigationBarContentState
    extends State<BottomNavigationBarContent> {
  List<Widget> page = [
    const DashboardScreen(),
    const PerfumeScreen(),
    const ShoppingCartScreen(),
    const AllCategoryScreen()
  ];
  ValueNotifier<int> currentPageIndexNotifier = ValueNotifier(0);
  final PageController pageController = PageController(initialPage: 0);
  // TabController tabController = TabController(length: 2, vsync: this);

  /// Local Methods
  changePageIndex(int index) {
    setState(() {
      currentPageIndexNotifier.value = index;
    });

    if (index > 1) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linearToEaseOut);
    }
  }

  // TabController tabController = TabController(length: _tabs.length, vsync: ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("Rohan Traders"),
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.shoppingCartScreenPageConfig);
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: PageView(
            onPageChanged: (index) {
              setState(() {
                currentPageIndexNotifier.value = index;
              });
            },
            controller: pageController,
            physics: const ScrollPhysics(),
            children: page,
          ),
          extendBody: true,
          bottomNavigationBar: ValueListenableBuilder(
              valueListenable: currentPageIndexNotifier,
              builder: ((context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Colors.amber),
                    ),
                    // height: 62.h,
                    // width: double.infinity,
                    child: BottomNavigationBar(
                      currentIndex: currentPageIndexNotifier.value,
                      backgroundColor: Colors.transparent,
                      unselectedItemColor: Colors.white,
                      selectedItemColor: Colors.amber,
                      selectedFontSize: 12,
                      unselectedFontSize: 10,
                      iconSize: 10,
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      onTap: (index) {
                        changePageIndex(index);
                      },
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          activeIcon: Icon(
                            Icons.account_balance_outlined,
                            color: Colors.amber,
                            size: 26.sp,
                          ),
                          backgroundColor: Colors.white,
                          icon: Icon(
                            Icons.account_balance_outlined,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                            activeIcon: InkWell(
                              onTap: () {
                                setState(() {});
                                AppState appState = sl();
                                appState
                                    .goToNext(PageConfigs.dashboardPageConfig);
                              },
                              child: InkWell(
                                onTap: () {
                                  AppState appState = sl();
                                  appState
                                      .goToNext(PageConfigs.perfumePageConfig);
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.amber,
                                  size: 26.sp,
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            label: 'Favourite'),
                        BottomNavigationBarItem(
                            activeIcon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.amber,
                              size: 26.sp,
                            ),
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 20.sp,
                              color: Colors.grey,
                            ),
                            label: 'Shopping Cart'),
                        BottomNavigationBarItem(
                            activeIcon: Icon(
                              Icons.category_outlined,
                              color: Colors.amber,
                              size: 26.sp,
                            ),
                            icon: Icon(
                              Icons.category_outlined,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                            label: 'Category'),
                      ],
                    ),
                  ),
                );
              }))),
    );
  }
}
