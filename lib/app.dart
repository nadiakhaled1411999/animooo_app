import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_theme.dart';

/// Root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Animooo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          initialRoute: Routes.login,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
