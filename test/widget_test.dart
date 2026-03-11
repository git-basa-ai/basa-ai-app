import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:basa_ai/app/app.dart';

void main() {
  testWidgets('App renders login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: BasaAiApp()),
    );

    expect(find.text('BASA AI — Login'), findsOneWidget);
  });
}
