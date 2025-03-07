import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart' show FrameTimingSummarizer;

class FpsController {
  static const _base = 1000000.0; //Don't ask and take it as it is

  final int precision;
  final _controller = StreamController<double>();

  FpsController({this.precision = 2}) {
    WidgetsBinding.instance.addTimingsCallback((timings) {
      final frameTimes = FrameTimingSummarizer(timings);
      final averageFrameTime = frameTimes.averageFrameBuildTime.inMicroseconds;
      final precision = pow(10, this.precision);
      final fps = (_base / averageFrameTime * precision).toInt() / precision;

      _controller.add(fps);
    });
  }

  Stream<double> get stream => _controller.stream;

  void dispose() => _controller.close();
}
