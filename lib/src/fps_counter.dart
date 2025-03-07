import 'package:flutter/material.dart';
import 'package:fps_counter/src/fps_controller.dart';

class FpsCounter extends StatelessWidget {
  final FpsController controller;

  final Widget? child;

  //Banner
  final Alignment bannerAlignment;
  final BannerLocation bannerLocation;
  final Color bannerColor;
  final TextStyle bannerTextStyle;

  const FpsCounter({
    required this.controller,
    this.child,
    this.bannerAlignment = Alignment.topLeft,
    this.bannerLocation = BannerLocation.topStart,
    this.bannerColor = Colors.blue,
    this.bannerTextStyle = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 12 * 0.85,
      fontWeight: FontWeight.w900,
      height: 1.0,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(),
    child: Stack(
      alignment: Alignment.topLeft,
      children: [
        if (child != null) child!,
        StreamBuilder(
          stream: controller.stream,
          builder:
              (context, snapshot) => switch (snapshot.data) {
                null => const SizedBox.shrink(),
                final fps => Banner(
                  message: '$fps',
                  location: bannerLocation,
                  color: bannerColor,
                  textStyle: bannerTextStyle,
                ),
              },
        ),
      ],
    ),
  );
}
