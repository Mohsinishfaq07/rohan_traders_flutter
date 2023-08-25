import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    Key? key,
    required this.title,
    this.isSelected = false,
    required this.ontap,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: isSelected ? Colors.amber : Colors.amber,
              width: 1,
            ),
            color: isSelected ? Colors.amber : Colors.white,
          ),
          height: 34.h,
          width: 80,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(
                  color: isSelected ? Colors.white : Colors.amber,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
