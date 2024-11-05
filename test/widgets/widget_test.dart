import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:conversor/screens/home_page.dart';
void main() {
  testWidgets('HomePage has correct appearance and functionality', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('Expected Text'), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('Valor convertido: 0.0'), findsOneWidget);
    expect(find.text('Updated Text'), findsOneWidget);
  });

  testWidgets('HomePage conversion functionality', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    await tester.enterText(find.byType(TextField), '100');
    await tester.tap(find.text('Converter'));
    await tester.pump();

    expect(find.text('Valor convertido: 0.0'), findsOneWidget);
  });

  testWidgets('HomePage initial state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('Valor convertido: 0.0'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}