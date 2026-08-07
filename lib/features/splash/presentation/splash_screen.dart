import '../../../core/routing/route_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.pets, size: 96, color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              'Animooo',
              style: AppTextStyles.font32TextPrimaryHeavy,
            ),
          ],
        ),
      ),
    );
  }
}
