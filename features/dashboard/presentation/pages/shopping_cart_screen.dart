import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShoppingCartScreenContent();
  }
}
class ShoppingCartScreenContent extends StatefulWidget {
  const ShoppingCartScreenContent({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreenContent> createState() => _ShoppingCartScreenContentState();
}

class _ShoppingCartScreenContentState extends State<ShoppingCartScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // drawer: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(30.r),
      //         bottomRight: Radius.circular(30.r),
      //       ),
      //       // color: Colors.blue
      //     ),
      //     child: CustomDrawer()),
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
        title: Text("Shopping Cart",
            style: TextStyle(fontSize: 20.sp, color: Colors.white)),
        backgroundColor: Colors.amber,
        // shadowColor: Colors.blue,

        // elevation: 20,
        // toolbarHeight: 20.h,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: InkWell(
        //       onTap: () {
        //         AppState appState = sl();
        //         appState.goToNext(PageConfigs.ShoppingCartScreenPageConfig);
        //       },
        //       child: const Icon(
        //         Icons.shopping_cart,
        //         color: Colors.white,
        //       ),
        //     ),
        //   )
        // ],
      ),
    );
  }
}

