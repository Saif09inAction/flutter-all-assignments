import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arcadelaunch/main.dart';

void main() {
  testWidgets('Arcade Launch lobby loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ArcadeApp());
    expect(find.text('ARCADE LAUNCH'), findsOneWidget);
    expect(find.text('NEON RACER'), findsOneWidget);
  });
}
