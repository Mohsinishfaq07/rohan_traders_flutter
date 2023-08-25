import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FavouriteScreenContent();
  }
}
class FavouriteScreenContent extends StatefulWidget {
  const FavouriteScreenContent({Key? key}) : super(key: key);

  @override
  State<FavouriteScreenContent> createState() => _FavouriteScreenContentState();
}

class _FavouriteScreenContentState extends State<FavouriteScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("My favourites",
            style: TextStyle(fontSize: 20.sp, color: Colors.white)),
        backgroundColor: Colors.amber,

      ),
    );
  }
}

