import 'package:flutter_test/flutter_test.dart';

import 'package:animooo_app/app.dart';
import 'package:animooo_app/features/auth/presentation/widgets/login_widgets/login_screen.dart';

void main() {
  testWidgets('App boots and shows a screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
