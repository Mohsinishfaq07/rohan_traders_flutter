import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, this.productList}) : super(key: key);
  List<Map>? productList;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.productList.toString());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // shadowColor: Colors.blue,
          shape: ContinuousRectangleBorder(
            side: BorderSide(color: Colors.amber, width: 1.w),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          title: Text("Rohan Traders",
              style: TextStyle(fontSize: 20.sp, color: Colors.white)),
          backgroundColor: Colors.amber,
          // shadowColor: Colors.blue,
          // elevation: 20,
          // toolbarHeight: 20.h,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.shoppingCartScreenPageConfig);
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: GridView.builder(
          itemCount: widget.productList!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 6.0,
            childAspectRatio: 0.8.w,
          ),
          itemBuilder: (context, ind) => InkWell(
            onTap: () {
              // final List<Map<String, dynamic>> filteredData = allCategories
              //     .where((item) => int.parse(item['Bikes']) == 25)
              //     .toList();
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(
                            widget.productList![ind]["image"],
                            fit: BoxFit.cover,
                          ))),
                  6.ph,
                  Center(
                    child: Row(
                      children: [

                        // Text(
                        //   allCategories[ind].keys.elementAt(0),
                        //   style: const TextStyle(color: Colors.white),
                        // ),
                        Text(
                          widget.productList![ind]["name"],
                          style: TextStyle(color: Colors.white,fontSize: 12.sp),
                        ),
                        Text(
                          widget.productList![ind]["price"]+":",
                          style: TextStyle(color: Colors.white,fontSize: 12.sp),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
