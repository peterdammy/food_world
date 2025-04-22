import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/screens/onboard_screen.dart';
import 'package:food_world/views/styles/theme_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food World',
            theme: lightMode,
            darkTheme: darkMode,
            home: OnboardScreen(),
          ),
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );
  }
}
