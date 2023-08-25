import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../widgets/all_categories_model.dart';
import '../widgets/custom_container_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DashboardScreenContent();
  }
}

class DashboardScreenContent extends StatefulWidget {
  const DashboardScreenContent({Key? key}) : super(key: key);

  @override
  State<DashboardScreenContent> createState() => _DashboardScreenContentState();
}

class _DashboardScreenContentState extends State<DashboardScreenContent> {
  final List<String> imageUrls = [
    'https://picsum.photos/200/300?random=1',
    'https://picsum.photos/200/300?random=2',
    'https://picsum.photos/200/300?random=3',
  ];
  int activeMenu = 0;
  int buttonSelected = 0;


  String _searchText = "";

  String activeCat = "Perfumes";

  List<Map> getData() {
    for (int i = 0; i <= allCategories.length; i++) {
      if (activeCat == allCategories[i].keys.first) {
        print("Found");
        return allCategories[i][allCategories[i].keys.first];
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        labelStyle: TextStyle(color: Colors.orange),
                        hintText: 'Search...',
                        hoverColor: Colors.orange,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _searchText = text;
                        });
                      }),
                  //  Padding(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: Text(
                  //     "New items",
                  //     style: GoogleFonts.lobster(
                  //       textStyle: TextStyle(fontSize: 20),color: Colors.white
                  //     )
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child:  Text(
                          "New Items",
                          style: TextStyle(color:Theme.of(context).primaryColor),
                        ),
                      ),
                      Container(
                        height: 0.5,
                        width: 100.w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  CarouselSlider.builder(
                    itemCount: imageUrls.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageUrl = imageUrls[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      " Categories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        CustomContainerButton(
                          isSelected: buttonSelected == 0,
                          title: 'Perfume',
                          ontap: () {
                            setState(() {
                              buttonSelected = 0;
                              activeCat = "Perfumes";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 1,
                          title: 'Bikes',
                          ontap: () {
                            setState(() {
                              buttonSelected = 1;
                              activeCat = "Bikes";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 4,
                          title: 'Threads',
                          ontap: () {
                            setState(() {
                              buttonSelected = 4;
                              activeCat = "Threads";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 2,
                          title: 'Cars',
                          ontap: () {
                            setState(() {
                              buttonSelected = 2;
                              activeCat = "Cars";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 3,
                          title: 'Property',
                          ontap: () {
                            setState(() {
                              buttonSelected = 3;
                              activeCat = "Property";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 5,
                          title: 'Apps',
                          ontap: () {
                            setState(() {
                              buttonSelected = 5;
                              activeCat = "Apps";
                            });
                          },
                        ),
                        CustomContainerButton(
                          isSelected: buttonSelected == 6,
                          title: 'Websites',
                          ontap: () {
                            setState(() {
                              buttonSelected = 6;
                              activeCat = "Websites";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Column(
                        children: List.generate(allCategories.length, (index) {
                      if (activeCat == allCategories[index].keys.first) {
                        debugPrint("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                        print(getData().length);
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
                                              PageConfigs.perfumePageConfig,pageState: PageState.replace);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r),
                                                child: Image.asset(
                                                  getData()[ind]["image"],
                                                  fit: BoxFit.cover,
                                                  // height: 120,
                                                  // width: 140,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getData()[ind]["name"],
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "price : ",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 10.sp),
                                                      ),
                                                      Text(
                                                        getData()[ind]
                                                                ["price"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white,
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

                  // SizedBox(
                  //   height: 50,
                  //   child: CustomButtons(
                  //       color: Colors.orange,
                  //       titleColor: Colors.white,
                  //       radius: BorderRadius.circular(10.r),
                  //       title: 'Order Now',
                  //       onTap: () {}),
                  // ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

