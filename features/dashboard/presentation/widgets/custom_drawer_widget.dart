import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      elevation: 0,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50.sp,
                  ),
                  const Text(
                    'My Information',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            title: const Text('Profile'),
            onTap: () {
              AppState appState = sl();
              appState.goToNext(PageConfigs.editProfileScreenPageConfig);
            },
          ),
           ListTile(
            leading: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            title: Text('My Favourite'),
            onTap: () {
              AppState appState = sl();
              appState.goToNext(PageConfigs.myFavouriteScreenPageConfig);
            },
          ),
          const ListTile(
            leading: Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.black,
            ),
            title: Text(' Order '),
            // onTap: () {
            //   AppState appState = sl();
            //   appState.goToNext(PageConfigs.myHistoryPageConfig);
            // },
          ),
          const ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.black,
            ),
            title: Text('payments'),
            // onTap: () {
            //   AppState appState = sl();
            //   appState.goToNext(PageConfigs.myHistoryPageConfig);
            // },
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              color: Colors.black,
            ),
            title: const Text('Shopping cart'),
            onTap: () {
              AppState appState = sl();
              appState.goToNext(PageConfigs.shoppingCartScreenPageConfig);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              color: Colors.black,
            ),
            title: const Text('My History'),
            onTap: () {
              AppState appState = sl();
              appState.goToNext(PageConfigs.historyScreenPageConfig);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: const Text('Log out'),
            onTap: () {
              auth.signOut().then((value) {
                AppState appState = sl();
                appState.goToNext(PageConfigs.logInScreenPageConfig);
              });
            },
          ),
        ],
      ),
    );
  }
}
