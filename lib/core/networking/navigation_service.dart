import 'package:flutter/material.dart';

// مفتاح عام للملاحة — يسمح بالتنقل بين الشاشات من أي مكان
// حتى من غير ما نكون جوه شاشة (مثلاً من الـ Interceptor)
class NavigationService {
  NavigationService._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // يروح لشاشة معينة ويمسح كل الشاشات اللي قبلها
  // مستخدم لما الجلسة تنتهي ولازم نرجع المستخدم لتسجيل الدخول
  static void pushNamedAndRemoveUntil(String routeName) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }
}
 