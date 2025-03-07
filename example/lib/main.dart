import 'package:flutter/material.dart';
import 'package:fps_counter/fps_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = FpsController();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FpsCounter(
      controller: _controller,
      child: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    ),
  );
}
