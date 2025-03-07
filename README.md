## Features
- Real-time FPS counter
- Customizable display options
- Lightweight and easy to integrate
- Minimal performance overhead
- Compatible with the latest Flutter versions

## Usage

### FpsController only
```dart
final _controller = FpsController();
```
and then
```dart
//Access the fps value through the stream
_controller.stream.listen((fps) {
    print('FPS: $fps');
});
```
---
### FpsCounter Widget
```dart
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
```
![result image](https://github.com/SaltySpaghetti/fps_counter/blob/main/doc/images/example_result.png)
