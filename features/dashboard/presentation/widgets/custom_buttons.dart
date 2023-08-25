import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButtons extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool loading;
  final Color? color;
  final IconData? icon;
  final BorderRadiusGeometry? radius;
  final VoidCallback onTap;
  const CustomButtons({Key? key,
    required this.title,
    this.titleColor,
    this.loading =false ,
    this.color,
    this.icon,
    this.radius,
    // this.widget,
    required this.onTap,
  }) : super(key: key);
  @override  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: radius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // if(widget!=null)
            //   widget!,
            SizedBox(
              width: 15.w,
            ),
            Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) : Text(title,style: TextStyle(color: titleColor,fontSize: 15.sp),)),
            Icon(icon,color: Colors.white,size: 20.w,)
          ],
        ),
      ),
    );
  }
}