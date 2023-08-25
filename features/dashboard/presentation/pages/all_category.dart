import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/product_page.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';
import '../../../../core/utils/globals/globals.dart';
import '../widgets/all_categories_model.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AllCategoryScreenContent();
  }
}

class AllCategoryScreenContent extends StatefulWidget {
  const AllCategoryScreenContent({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreenContent> createState() =>
      _AllCategoryScreenContentState();
}

class _AllCategoryScreenContentState extends State<AllCategoryScreenContent> {
  String activeCat = "Perfumes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: List.generate(allCategories.length, (index) {
        if (activeCat == allCategories[index].keys.first) {
          return Expanded(
            child: GridView.builder(
                itemCount: allCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.8.w,
                ),

                itemBuilder: (context, ind) => InkWell(
                      onTap: () {
                        final List<Map<String, dynamic>> filteredData = allCategories
                            .where((item) => int.parse(item['Bikes']) == 25)
                            .toList();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            AppState appState = sl();
                            appState.addWidget(
                                page: PageConfigs.productPageConfig,
                                child: ProductPage(
                                  productList:
                                      (allCategories[ind].values.first),
                                ));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.asset(
                                        allCategories[ind]["Image"],
                                        fit: BoxFit.cover,
                                      ))),
                              6.ph,

                              Text(
                                allCategories[ind].keys.elementAt(0),
                                style: const TextStyle(color: Colors.white),
                              ),
                              // Text(
                              //   allCategories[ind]["price"],
                              //   style: const TextStyle(color: Colors.white),
                              // ),
                              // Text(
                              //
                              //   widget.productList![ind]["price"],
                              //   style: const TextStyle(color: Colors.white),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    )),
          );
        } else {
          return const SizedBox();
        }
      })),
    );
  }
}
