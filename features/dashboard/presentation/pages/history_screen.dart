import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const HistoryScreenContent();
  }
}
class HistoryScreenContent extends StatefulWidget {
  const HistoryScreenContent({Key? key}) : super(key: key);

  @override
  State<HistoryScreenContent> createState() => _HistoryScreenContentState();
}

class _HistoryScreenContentState extends State<HistoryScreenContent> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: Text("History Screen",
            style: TextStyle(fontSize: 20.sp, color: Colors.white)),
        backgroundColor: Colors.amber,
        // shadowColor: Colors.blue,

        // elevation: 20,
        // toolbarHeight: 20.h,

      ),
      body: Column(
        children: const [
          Text("This is History screen "),
        ],
      ),
    );
  }
}

