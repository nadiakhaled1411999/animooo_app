import 'package:animooo_app/core/widgets/under_construction_screen.dart';
import 'package:animooo_app/features/login/presentation/login_screen.dart';
import 'package:animooo_app/features/signup/presentation/sign_up_screen.dart';

import 'route_export.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const UnderConstructionScreen(),
          settings: settings,
        );
    }
  }
}
