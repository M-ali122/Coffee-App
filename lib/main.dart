import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme/app_theme.dart';
import 'views/onboarding/onboarding_view.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Coffee UI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: child,
          getPages: [
            GetPage(name: '/', page: () => OnboardingView()),
            GetPage(name: '/home', page: () => HomeView()),
          ],
        );
      },
      child: OnboardingView(),
    );
  }
}
