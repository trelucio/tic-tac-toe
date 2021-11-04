// Widget Tests

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/main.dart';

void main() {
  testWidgets('verify widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that certain words do show up and some don't 
    expect(find.text('Tic-Tac-Toe'), findsOneWidget);
    expect(find.text('Start Game'), findsOneWidget);
    expect(find.text('foo'), findsNothing);

    // Verify there's a start button to start the game
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    
  });
}
