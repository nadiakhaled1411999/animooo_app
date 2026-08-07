import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/DI/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();
  await setupDependencyInjection();

  runApp(const App());
}
