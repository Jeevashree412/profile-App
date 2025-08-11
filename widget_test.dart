import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ggaghhh/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter decrements when "-" is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Increment once to make sure decrement is visible
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });

  testWidgets('Counter does not go below 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter is still 0 (assuming it can't go negative)
    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);
  });

  testWidgets('Multiple increments work correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon three times.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter is 3.
    expect(find.text('3'), findsOneWidget);
  });
}
