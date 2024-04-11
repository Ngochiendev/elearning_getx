import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ExerciseProgress extends StatelessWidget {
  ExerciseProgress({required this.value, this.customImage, Key? key}) : super(key: key);

  final double value;
  final ui.Image? customImage;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 4,
        inactiveTrackColor: colorNeutralGray5,
        activeTrackColor: colorSecondaryRed100,
        disabledActiveTrackColor: colorSecondaryRed100,
        thumbShape: customImage != null ? SliderThumbImage(customImage!) : null,
      ),
      child: Slider(
        value: value < 0
            ? 0
            : value > 1
                ? 1
                : value,
        max: 1.0,
        min: 0.0,
        onChanged: null,
      ),
    );
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image image;

  SliderThumbImage(this.image);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight * 0.8),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    canvas.drawImage(image, imageOffset, paint);
  }
}
