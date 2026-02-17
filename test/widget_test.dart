
import 'package:flutter/material.dart';
import 'package:flutter_lab_15/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('app bar title test', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MyHomePage(title: 'IPZ-33: Maksym\'s last Flutter App'),
    ),
  );
  await tester.pump();
  final regExp = RegExp(r"^.+: .+'s last Flutter App$");
  final appBarTitle = tester.widget<Text>(
    find.descendant(
      of: find.byType(AppBar),
      matching: find.byType(Text),
    ),
  );
    expect(regExp.hasMatch(appBarTitle.data!), true);
  });


  testWidgets('check correct FloatingActionButton', (tester) async {
  await tester.pumpWidget(MaterialApp(home: MyHomePage(title: 'IPZ-33: Maksym\'s last Flutter App')));
  expect(find.byType(FloatingActionButton), findsOneWidget);
  expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);
});

  testWidgets('check counter', (tester) async {
  await tester.pumpWidget(MaterialApp(home: MyHomePage(title: 'IPZ-33: Maksym\'s last Flutter App')));
  expect(find.text('0'), findsOneWidget);
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pump();
   expect(find.text('6'), findsOneWidget);
  });
}
