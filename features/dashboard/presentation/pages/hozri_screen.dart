import 'package:flutter/material.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';

class HozriScreen extends StatelessWidget {
  const HozriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HozriScreenContent();
  }
}

class HozriScreenContent extends StatefulWidget {
  const HozriScreenContent({Key? key}) : super(key: key);

  @override
  State<HozriScreenContent> createState() => _HozriScreenContentState();
}

class _HozriScreenContentState extends State<HozriScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng,fit: BoxFit.fitHeight,))),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng,fit: BoxFit.fitHeight,))),

              // 20.pw,
            ],
          ),
         Row(

           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: [
              Container(color: Colors.green,
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng))),
              Container(color: Colors.green,
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng))),

              // 20.pw,
            ],
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
              Container(color: Colors.green,
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng))),
              Container(color: Colors.green,
                  height: 150,
                  width: 150,
                  child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.perfumePageConfig);
                      },
                      child: Image.asset(AppAssets.bgPng))),
              // 20.pw,
            ],
          ),
        ],
      ),
    );
  }
}
