// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:shekharboard/main.dart';

void main() {
  testWidgets('App should display title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShekharBoardApp());

    // Verify that app title is displayed
    expect(find.text('শেখার বোর্ড'), findsOneWidget);
    expect(find.text('Touch & Learn Board'), findsOneWidget);
  });
}
