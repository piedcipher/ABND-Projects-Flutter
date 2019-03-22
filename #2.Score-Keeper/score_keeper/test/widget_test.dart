// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:score_keeper/main.dart';

void main() {
  testWidgets('Clash Of Cupheads Simple Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Game());

    // Verify that scores are at 0 & HP at 25.
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('25'), findsNWidgets(2));

    // Tap the refresh icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that after pressing reset button scores are reset to 0 & HPs are reset to 25.
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('25'), findsNWidgets(2));
  });
}
