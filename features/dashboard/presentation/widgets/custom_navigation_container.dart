import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
    this.icon,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final IconData? icon;
  final bool isSelected;
  @override  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child:  Icon(
          icon,
          color: isSelected ? Colors.amber: Colors.black,
        ),
      ),
    );
  }}