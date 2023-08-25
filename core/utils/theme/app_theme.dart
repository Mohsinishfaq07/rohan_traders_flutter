import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/custom_transition.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      },
    ),
    hintColor: Colors.amber,
    // primaryColor: const Color(0xFF000812),
    canvasColor: Colors.grey,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.purpleAccent,
    indicatorColor: const Color(0xFFF6BC18),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
      elevation: 0,
      toolbarHeight: 70.h,
    ),

    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFF000812).withOpacity(0.4),
      selectionHandleColor: const Color(0xFF000812),
      cursorColor: const Color(0xFF000812),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 10, backgroundColor: Colors.white),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF818492),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,



      isCollapsed: false,
      // isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
          color: Color(0xFF000812),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0xFF000812)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xFF000812).withOpacity(0.7);
          } else {
            return const Color(0xFF000812);
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(width: 1.5, color: const Color(0xFF000812).withOpacity(0.7));
          } else {
            return const BorderSide(width: 1.5, color: Color(0xFF000812));
          }
        }),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        maximumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
        minimumSize: MaterialStateProperty.all(Size(64.w, 48.h)),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      ),
    ), colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF261854),
      errorColor: Colors.red,
    ).copyWith(error: Colors.redAccent),
  );
}
