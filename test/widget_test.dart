import 'package:flutter_test/flutter_test.dart';

import 'package:animooo_app/app.dart';
import 'package:animooo_app/core/widgets/under_construction_screen.dart';

void main() {
  testWidgets('App boots and shows a screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionScreen), findsOneWidget);
  });
}
