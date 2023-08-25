import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class PerfumeScreen extends StatelessWidget {
  const PerfumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PerfumeScreenContent();
  }
}

class PerfumeScreenContent extends StatefulWidget {
  const PerfumeScreenContent({Key? key}) : super(key: key);

  @override
  State<PerfumeScreenContent> createState() => _PerfumeScreenContentState();
}

class _PerfumeScreenContentState extends State<PerfumeScreenContent> {
  // final List<Widget> _tabs = [
  //   Container(
  //     color: Colors.red,
  //   ),
  //   Container(
  //     color: Colors.green,
  //   ),
  //   Container(
  //     color: Colors.blue,
  //   ),
  // ];
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    // Initialize data
  }
  void _printLatestValue() {
    // activeCat= ;

    print('Text field value: ${myController.text}');
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> perfumes = [
    {
      "Small": [
        {
          "name": "Charlie Red",
          "price": "360000",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "Charlie Silver",
          "price": "215000",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "Blue lady",
          "price": "360000",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "Havoc",
          "price": "600000",
          "image": 'assets/images/thread1.png'
        },
      ],
    },
    {
      "Medium": [
        {
          "name": "Dunhil london",
          "price": "500",
          "image": 'assets/images/perfume1.png'
        },
        {
          "name": "Dunhil black",
          "price": "500",
          "image": 'assets/images/perfume1.png'
        },
        {
          "name": "Charlie Silver",
          "price": "500",
          "image": 'assets/images/perfume1.png'
        },
        {
          "name": "Charlie Red",
          "price": "500",
          "image": 'assets/images/perfume1.png'
        },
      ],
    },
    {
      "Large": [
        {
          "name": "Delicia green",
          "price": "500",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "Cool Water",
          "price": "500",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "poison",
          "price": "500",
          "image": 'assets/images/thread1.png'
        },
        {
          "name": "Open",
          "price": "500",
          "image": 'assets/images/thread1.png'
        },
      ],
    },

  ];
  String activeCat = "Small";
  List<Map> getData() {
    for (int i = 0; i <= perfumes.length; i++) {
      if (activeCat == perfumes[i].keys.first) {
        print("Found");
        return perfumes[i][perfumes[i].keys.first];
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: perfumes.length,
      child: Scaffold(

        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Perfumes'),
          bottom: const TabBar(
            tabs: [
              Text("Small"),
              Text("Medium"),
              Text("Large"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SizedBox(
              height: 300,
              child: Column(
                  children: List.generate(perfumes.length, (index) {
                if (activeCat == perfumes[index].keys.first) {
                  return Expanded(
                    child: GridView.builder(
                        itemCount: getData().length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6.0,
                          crossAxisSpacing: 6.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, ind) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    AppState appState = sl();
                                    appState.goToNext(
                                        PageConfigs.perfumePageConfig);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          child: Image.asset(
                                            getData()[ind]["image"],
                                            fit: BoxFit.cover,
                                            height: 120,
                                            width: 140,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getData()[ind]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "price : ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                ),
                                                Text(
                                                  getData()[ind]["price"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                  );
                } else {
                  return const SizedBox();
                }
              })),
            ),
            SizedBox(
              height: 300,
              child: Column(
                  children: List.generate(perfumes.length, (index) {
                if (activeCat == perfumes[index].keys.last) {
                  return Expanded(
                    child: GridView.builder(
                        itemCount: getData().length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6.0,
                          crossAxisSpacing: 6.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, ind) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    AppState appState = sl();
                                    appState.goToNext(
                                        PageConfigs.perfumePageConfig);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          child: Image.asset(
                                            getData()[ind]["image"],
                                            fit: BoxFit.cover,
                                            height: 120,
                                            width: 140,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getData()[ind]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "price : ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                ),
                                                Text(
                                                  getData()[ind]["price"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                  );
                } else {
                  return const SizedBox();
                }
              })),
            ),
            SizedBox(
              height: 300,
              child: Column(
                  children: List.generate(perfumes.length, (index) {
                if (activeCat == perfumes[index].keys.first) {
                  print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                  return Expanded(
                    child: GridView.builder(
                        itemCount: getData().length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6.0,
                          crossAxisSpacing: 6.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, ind) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    AppState appState = sl();
                                    appState.goToNext(
                                        PageConfigs.perfumePageConfig);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          child: Image.asset(
                                            getData()[ind]["image"],
                                            fit: BoxFit.cover,
                                            height: 120,
                                            width: 140,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getData()[ind]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "price : ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                ),
                                                Text(
                                                  getData()[ind]["price"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                  );
                } else {
                  return const SizedBox();
                }
              })),
            ),
          ],
        ),
      ),
    );
  }
}
