// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'theme/app_theme.dart';
// import 'views/onboarding/onboarding_view.dart';
// import 'views/home/home_view.dart';

// void main() {
//   runApp(CoffeeApp());
// }

// class CoffeeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Coffee UI',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.light,
//       // start at onboarding
//       home: OnboardingView(),
//       getPages: [
//         GetPage(name: '/', page: () => OnboardingView()),
//         GetPage(name: '/home', page: () => HomeView()),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';   // <-- Added
import 'theme/app_theme.dart';
import 'views/onboarding/onboarding_view.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(                               // <-- Added Wrapper
      designSize: const Size(375, 812),                  // iPhone 11 size (common)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Coffee UI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: child,                                   // <-- child assigned
          getPages: [
            GetPage(name: '/', page: () => OnboardingView()),
            GetPage(name: '/home', page: () => HomeView()),
          ],
        );
      },
      child: OnboardingView(),                           // <-- Starting Screen
    );
  }
}
