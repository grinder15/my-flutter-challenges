import 'dart:math';

import 'package:circular_segment_button/circular_segment_button.dart';
import 'package:flutter/widgets.dart';

class CircularSegmentPaint extends CustomPainter {
  final double gap;
  final double startAngle;
  final List<Segment> segments;

  CircularSegmentPaint({
    this.startAngle,
    this.gap = 0,
    this.segments,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final _centerX = size.width / 2;
    final _centerY = size.width / 2;
    final _center = Offset(_centerX, _centerY);

    final _circunference = pi * 2;
    final _segmentGap = 0.0174532925 * gap;
    final _segmentSize = (_circunference / segments.length) - _segmentGap;

    double _startAngle = startAngle ?? -(_circunference / 2);

    for (int i = 0; i < segments.length; i++) {
      final _segment = segments[i];

      if (i == 0) {
        _startAngle += _segmentSize;
      } else {
        _startAngle += _segmentSize + _segmentGap;
      }

      final _segmentPaint = Paint()
        ..strokeCap = StrokeCap.round
        ..color = _segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = _segment.strokeWidth ?? 10;

      canvas.drawArc(
        Rect.fromCenter(
          center: _center,
          width: size.width,
          height: size.height,
        ),
        _startAngle,
        _segmentSize,
        false,
        _segmentPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
