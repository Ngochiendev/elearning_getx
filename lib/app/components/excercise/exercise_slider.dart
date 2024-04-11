import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class ExerciseSlider extends StatefulWidget {
  ExerciseSlider({required this.initValue, this.onChanged, Key? key}) : super(key: key);

  final double initValue;
  final void Function(double value)? onChanged;

  @override
  _ExerciseSliderState createState() => _ExerciseSliderState();
}

class _ExerciseSliderState extends State<ExerciseSlider> {
  ui.Image? customImage;
  double sliderValue = 0.0;

  Future<ui.Image> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();

    return fi.image;
  }

  @override
  void initState() {
    loadImage('assets/png/ic_fire.png').then((image) {
      setState(() {
        sliderValue = widget.initValue;
        customImage = image;
      });
    });

    super.initState();
  }

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
        value: sliderValue,
        max: 1.0,
        min: 0.0,
        onChanged: widget.onChanged != null
            ? (value) {
                setState(() {
                  sliderValue = value;
                  widget.onChanged!(value);
                });
              }
            : null,
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
