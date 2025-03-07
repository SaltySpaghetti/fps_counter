import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fps_counter/fps_counter.dart';

void main() {
  late String text;

  setUp(() {
    text = 'Hello, World!';
  });

  testWidgets('Should show the given child', (widgetTester) async {
    final fpsCounter = MaterialApp(
      home: Scaffold(
        body: FpsCounter(
          controller: FpsController(), 
          child: Text(text),
        ),
      ),
    );

    await widgetTester.pumpWidget(fpsCounter);

    expect(find.text(text), findsOneWidget);
    expect(find.byType(Banner), findsOneWidget);
  });
}
