import 'package:animooo_app/core/widgets/under_construction_screen.dart';
import 'package:animooo_app/features/splash/presentation/splash_screen.dart';

import 'route_export.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
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
