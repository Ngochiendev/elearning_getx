import 'package:flutter/material.dart';
import 'dart:ui' as ui;

//Copy this CustomPainter code to the Bottom of the File
class DicountCustomPainter extends CustomPainter {
  final bool isChecked;
  DicountCustomPainter(this.isChecked);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.06153846);
    path_0.cubicTo(0, size.height * 0.02755169, size.width * 0.01044233, 0, size.width * 0.02332362, 0);
    path_0.lineTo(size.width * 0.9766764, 0);
    path_0.cubicTo(size.width * 0.9895569, 0, size.width, size.height * 0.02755169, size.width, size.height * 0.06153846);
    path_0.lineTo(size.width, size.height * 0.3230769);
    path_0.cubicTo(size.width * 0.9677959, size.height * 0.3230769, size.width * 0.9416910, size.height * 0.3919562, size.width * 0.9416910, size.height * 0.4769231);
    path_0.cubicTo(size.width * 0.9416910, size.height * 0.5618900, size.width * 0.9677959, size.height * 0.6307692, size.width, size.height * 0.6307692);
    path_0.lineTo(size.width, size.height * 0.9384615);
    path_0.cubicTo(size.width, size.height * 0.9724462, size.width * 0.9895569, size.height, size.width * 0.9766764, size.height);
    path_0.lineTo(size.width * 0.02332359, size.height);
    path_0.cubicTo(size.width * 0.01044233, size.height, 0, size.height * 0.9724462, 0, size.height * 0.9384615);
    path_0.lineTo(0, size.height * 0.6259223);
    path_0.cubicTo(size.width * 0.02514910, size.height * 0.6088438, size.width * 0.04373178, size.height * 0.5486092, size.width * 0.04373178, size.height * 0.4769231);
    path_0.cubicTo(size.width * 0.04373178, size.height * 0.4052369, size.width * 0.02514910, size.height * 0.3450023, 0, size.height * 0.3279238);
    path_0.lineTo(0, size.height * 0.06153846);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.06153846);
    path_1.cubicTo(0, size.height * 0.02755169, size.width * 0.01044233, 0, size.width * 0.02332362, 0);
    path_1.lineTo(size.width * 0.9766764, 0);
    path_1.cubicTo(size.width * 0.9895569, 0, size.width, size.height * 0.02755169, size.width, size.height * 0.06153846);
    path_1.lineTo(size.width, size.height * 0.3230769);
    path_1.cubicTo(size.width * 0.9677959, size.height * 0.3230769, size.width * 0.9416910, size.height * 0.3919562, size.width * 0.9416910, size.height * 0.4769231);
    path_1.cubicTo(size.width * 0.9416910, size.height * 0.5618900, size.width * 0.9677959, size.height * 0.6307692, size.width, size.height * 0.6307692);
    path_1.lineTo(size.width, size.height * 0.9384615);
    path_1.cubicTo(size.width, size.height * 0.9724462, size.width * 0.9895569, size.height, size.width * 0.9766764, size.height);
    path_1.lineTo(size.width * 0.02332359, size.height);
    path_1.cubicTo(size.width * 0.01044233, size.height, 0, size.height * 0.9724462, 0, size.height * 0.9384615);
    path_1.lineTo(0, size.height * 0.6259223);
    path_1.cubicTo(size.width * 0.02514910, size.height * 0.6088438, size.width * 0.04373178, size.height * 0.5486092, size.width * 0.04373178, size.height * 0.4769231);
    path_1.cubicTo(size.width * 0.04373178, size.height * 0.4052369, size.width * 0.02514910, size.height * 0.3450023, 0, size.height * 0.3279238);
    path_1.lineTo(0, size.height * 0.06153846);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width, size.height * 0.3230769);
    path_2.lineTo(size.width, size.height * 0.3307692);
    path_2.lineTo(size.width * 1.002915, size.height * 0.3307692);
    path_2.lineTo(size.width * 1.002915, size.height * 0.3230769);
    path_2.lineTo(size.width, size.height * 0.3230769);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.6307692);
    path_2.lineTo(size.width * 1.002915, size.height * 0.6307692);
    path_2.lineTo(size.width * 1.002915, size.height * 0.6230769);
    path_2.lineTo(size.width, size.height * 0.6230769);
    path_2.lineTo(size.width, size.height * 0.6307692);
    path_2.close();
    path_2.moveTo(0, size.height * 0.6259223);
    path_2.lineTo(size.width * -0.0007267026, size.height * 0.6184731);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.6199592);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.6259223);
    path_2.lineTo(0, size.height * 0.6259223);
    path_2.close();
    path_2.moveTo(0, size.height * 0.3279238);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.3279238);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.3338869);
    path_2.lineTo(size.width * -0.0007267026, size.height * 0.3353731);
    path_2.lineTo(0, size.height * 0.3279238);
    path_2.close();
    path_2.moveTo(size.width * 0.02332362, size.height * -0.007692308);
    path_2.cubicTo(size.width * 0.008832187, size.height * -0.007692308, size.width * -0.002915452, size.height * 0.02330338, size.width * -0.002915452, size.height * 0.06153846);
    path_2.lineTo(size.width * 0.002915452, size.height * 0.06153846);
    path_2.cubicTo(size.width * 0.002915452, size.height * 0.03180008, size.width * 0.01205251, size.height * 0.007692308, size.width * 0.02332362, size.height * 0.007692308);
    path_2.lineTo(size.width * 0.02332362, size.height * -0.007692308);
    path_2.close();
    path_2.moveTo(size.width * 0.9766764, size.height * -0.007692308);
    path_2.lineTo(size.width * 0.02332362, size.height * -0.007692308);
    path_2.lineTo(size.width * 0.02332362, size.height * 0.007692308);
    path_2.lineTo(size.width * 0.9766764, size.height * 0.007692308);
    path_2.lineTo(size.width * 0.9766764, size.height * -0.007692308);
    path_2.close();
    path_2.moveTo(size.width * 1.002915, size.height * 0.06153846);
    path_2.cubicTo(size.width * 1.002915, size.height * 0.02330338, size.width * 0.9911691, size.height * -0.007692308, size.width * 0.9766764, size.height * -0.007692308);
    path_2.lineTo(size.width * 0.9766764, size.height * 0.007692308);
    path_2.cubicTo(size.width * 0.9879475, size.height * 0.007692308, size.width * 0.9970845, size.height * 0.03180008, size.width * 0.9970845, size.height * 0.06153846);
    path_2.lineTo(size.width * 1.002915, size.height * 0.06153846);
    path_2.close();
    path_2.moveTo(size.width * 1.002915, size.height * 0.3230769);
    path_2.lineTo(size.width * 1.002915, size.height * 0.06153846);
    path_2.lineTo(size.width * 0.9970845, size.height * 0.06153846);
    path_2.lineTo(size.width * 0.9970845, size.height * 0.3230769);
    path_2.lineTo(size.width * 1.002915, size.height * 0.3230769);
    path_2.close();
    path_2.moveTo(size.width * 0.9446064, size.height * 0.4769231);
    path_2.cubicTo(size.width * 0.9446064, size.height * 0.3962046, size.width * 0.9694082, size.height * 0.3307692, size.width, size.height * 0.3307692);
    path_2.lineTo(size.width, size.height * 0.3153846);
    path_2.cubicTo(size.width * 0.9661866, size.height * 0.3153846, size.width * 0.9387755, size.height * 0.3877077, size.width * 0.9387755, size.height * 0.4769231);
    path_2.lineTo(size.width * 0.9446064, size.height * 0.4769231);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.6230769);
    path_2.cubicTo(size.width * 0.9694082, size.height * 0.6230769, size.width * 0.9446064, size.height * 0.5576415, size.width * 0.9446064, size.height * 0.4769231);
    path_2.lineTo(size.width * 0.9387755, size.height * 0.4769231);
    path_2.cubicTo(size.width * 0.9387755, size.height * 0.5661385, size.width * 0.9661866, size.height * 0.6384615, size.width, size.height * 0.6384615);
    path_2.lineTo(size.width, size.height * 0.6230769);
    path_2.close();
    path_2.moveTo(size.width * 1.002915, size.height * 0.9384615);
    path_2.lineTo(size.width * 1.002915, size.height * 0.6307692);
    path_2.lineTo(size.width * 0.9970845, size.height * 0.6307692);
    path_2.lineTo(size.width * 0.9970845, size.height * 0.9384615);
    path_2.lineTo(size.width * 1.002915, size.height * 0.9384615);
    path_2.close();
    path_2.moveTo(size.width * 0.9766764, size.height * 1.007692);
    path_2.cubicTo(size.width * 0.9911691, size.height * 1.007692, size.width * 1.002915, size.height * 0.9767000, size.width * 1.002915, size.height * 0.9384615);
    path_2.lineTo(size.width * 0.9970845, size.height * 0.9384615);
    path_2.cubicTo(size.width * 0.9970845, size.height * 0.9682000, size.width * 0.9879475, size.height * 0.9923077, size.width * 0.9766764, size.height * 0.9923077);
    path_2.lineTo(size.width * 0.9766764, size.height * 1.007692);
    path_2.close();
    path_2.moveTo(size.width * 0.02332359, size.height * 1.007692);
    path_2.lineTo(size.width * 0.9766764, size.height * 1.007692);
    path_2.lineTo(size.width * 0.9766764, size.height * 0.9923077);
    path_2.lineTo(size.width * 0.02332359, size.height * 0.9923077);
    path_2.lineTo(size.width * 0.02332359, size.height * 1.007692);
    path_2.close();
    path_2.moveTo(size.width * -0.002915452, size.height * 0.9384615);
    path_2.cubicTo(size.width * -0.002915452, size.height * 0.9767000, size.width * 0.008832157, size.height * 1.007692, size.width * 0.02332359, size.height * 1.007692);
    path_2.lineTo(size.width * 0.02332359, size.height * 0.9923077);
    path_2.cubicTo(size.width * 0.01205248, size.height * 0.9923077, size.width * 0.002915452, size.height * 0.9682000, size.width * 0.002915452, size.height * 0.9384615);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.9384615);
    path_2.close();
    path_2.moveTo(size.width * -0.002915452, size.height * 0.6259223);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.9384615);
    path_2.lineTo(size.width * 0.002915452, size.height * 0.9384615);
    path_2.lineTo(size.width * 0.002915452, size.height * 0.6259223);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.6259223);
    path_2.close();
    path_2.moveTo(size.width * 0.04081633, size.height * 0.4769231);
    path_2.cubicTo(size.width * 0.04081633, size.height * 0.5450146, size.width * 0.02316557, size.height * 0.6022477, size.width * -0.0007267026, size.height * 0.6184731);
    path_2.lineTo(size.width * 0.0007267026, size.height * 0.6333715);
    path_2.cubicTo(size.width * 0.02713262, size.height * 0.6154400, size.width * 0.04664723, size.height * 0.5522038, size.width * 0.04664723, size.height * 0.4769231);
    path_2.lineTo(size.width * 0.04081633, size.height * 0.4769231);
    path_2.close();
    path_2.moveTo(size.width * -0.0007267026, size.height * 0.3353731);
    path_2.cubicTo(size.width * 0.02316557, size.height * 0.3515985, size.width * 0.04081633, size.height * 0.4088315, size.width * 0.04081633, size.height * 0.4769231);
    path_2.lineTo(size.width * 0.04664723, size.height * 0.4769231);
    path_2.cubicTo(size.width * 0.04664723, size.height * 0.4016423, size.width * 0.02713262, size.height * 0.3384062, size.width * 0.0007267026, size.height * 0.3204746);
    path_2.lineTo(size.width * -0.0007267026, size.height * 0.3353731);
    path_2.close();
    path_2.moveTo(size.width * -0.002915452, size.height * 0.06153846);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.3279238);
    path_2.lineTo(size.width * 0.002915452, size.height * 0.3279238);
    path_2.lineTo(size.width * 0.002915452, size.height * 0.06153846);
    path_2.lineTo(size.width * -0.002915452, size.height * 0.06153846);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = isChecked ? Color(0xffCF3135).withOpacity(0.5) : Color(0xffF3F3F4).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.02332362, 0);
    path_3.cubicTo(size.width * 0.01044233, 0, 0, size.height * 0.02755169, 0, size.height * 0.06153846);
    path_3.lineTo(0, size.height * 0.3279238);
    path_3.cubicTo(size.width * 0.02514910, size.height * 0.3450023, size.width * 0.04373178, size.height * 0.4052369, size.width * 0.04373178, size.height * 0.4769231);
    path_3.cubicTo(size.width * 0.04373178, size.height * 0.5486092, size.width * 0.02514910, size.height * 0.6088438, 0, size.height * 0.6259223);
    path_3.lineTo(0, size.height * 0.9384615);
    path_3.cubicTo(0, size.height * 0.9724462, size.width * 0.01044233, size.height, size.width * 0.02332362, size.height);
    path_3.lineTo(size.width * 0.3381924, size.height);
    path_3.lineTo(size.width * 0.3381924, 0);
    path_3.lineTo(size.width * 0.02332362, 0);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffCF3135).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.09620991, size.height * 0.3966131);
    path_4.lineTo(size.width * 0.1701732, size.height * 0.3307692);
    path_4.lineTo(size.width * 0.2448980, size.height * 0.3966131);
    path_4.lineTo(size.width * 0.1701732, size.height * 0.4722069);
    path_4.lineTo(size.width * 0.09620991, size.height * 0.3966131);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.1205286, size.height * 0.4604269);
    path_5.lineTo(size.width * 0.1627207, size.height * 0.4997208);
    path_5.lineTo(size.width * 0.1627207, size.height * 0.6726138);
    path_5.lineTo(size.width * 0.1562711, size.height * 0.6581962);
    path_5.lineTo(size.width * 0.1508067, size.height * 0.6726138);
    path_5.lineTo(size.width * 0.1508067, size.height * 0.6099008);
    path_5.lineTo(size.width * 0.1205286, size.height * 0.5809285);
    path_5.lineTo(size.width * 0.1205286, size.height * 0.4604269);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.1756318, size.height * 0.5062600);
    path_6.lineTo(size.width * 0.1756318, size.height * 0.6176023);
    path_6.lineTo(size.width * 0.2203099, size.height * 0.5796085);
    path_6.lineTo(size.width * 0.2203099, size.height * 0.4604269);
    path_6.lineTo(size.width * 0.1756318, size.height * 0.5062600);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.1705551, size.height * 0.4427608);
    path_7.cubicTo(size.width * 0.1768673, size.height * 0.4427608, size.width * 0.1819843, size.height * 0.4292600, size.width * 0.1819843, size.height * 0.4126062);
    path_7.cubicTo(size.width * 0.1819843, size.height * 0.3959515, size.width * 0.1768673, size.height * 0.3824508, size.width * 0.1705551, size.height * 0.3824508);
    path_7.cubicTo(size.width * 0.1642431, size.height * 0.3824508, size.width * 0.1591262, size.height * 0.3959515, size.width * 0.1591262, size.height * 0.4126062);
    path_7.cubicTo(size.width * 0.1591262, size.height * 0.4292600, size.width * 0.1642431, size.height * 0.4427608, size.width * 0.1705551, size.height * 0.4427608);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffCF3135).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);
    if (isChecked) {
      Paint paint_8_stroke = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      paint_8_stroke.color = Color(0xffCF3135).withOpacity(1.0);
      canvas.drawCircle(Offset(size.width * 0.9271137, size.height * 0.1846154), size.width * 0.01992224, paint_8_stroke);

      Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
      paint_8_fill.color = Color(0xffCF3135).withOpacity(1.0);
      canvas.drawCircle(Offset(size.width * 0.9271137, size.height * 0.1846154), size.width * 0.01992224, paint_8_fill);

      final icon = Icons.check;
      var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontFamily: icon.fontFamily,
      ))
        ..addText(String.fromCharCode(icon.codePoint));
      var para = builder.build();
      para.layout(const ui.ParagraphConstraints(width: 60));
      canvas.drawParagraph(para, Offset(size.width * 0.908, size.height * 0.13));
    } else {
      Paint paint_8_stroke = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      paint_8_stroke.color = Color(0xffD1D1D4).withOpacity(1.0);
      canvas.drawCircle(Offset(size.width * 0.9271137, size.height * 0.1846154), size.width * 0.01992224, paint_8_stroke);

      Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
      paint_8_fill.color = Color(0xffffffff).withOpacity(1.0);
      canvas.drawCircle(Offset(size.width * 0.9271137, size.height * 0.1846154), size.width * 0.01992224, paint_8_fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
