import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class CustomPaintNotch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    // paint.color = Colors.black;
    // paint.strokeWidth = 2;
    // paint.style = PaintingStyle.stroke;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint);

    Offset center = Offset(0, size.height / 2);
    RRect roundRectangle = RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 40.0, height: 40.0),
        Radius.circular(20.0));
    canvas.drawRRect(roundRectangle, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.06865344);
    path_0.cubicTo(0, size.height * 0.03073713, size.width * 0.01425490, 0,
        size.width * 0.03183913, 0);
    path_0.lineTo(size.width * 0.9681609, 0);
    path_0.cubicTo(size.width * 0.9857449, 0, size.width,
        size.height * 0.03073713, size.width, size.height * 0.06865344);
    path_0.lineTo(size.width, size.height * 0.3504250);
    path_0.cubicTo(
        size.width * 0.9975420,
        size.height * 0.3501437,
        size.width * 0.9950594,
        size.height * 0.3500000,
        size.width * 0.9925551,
        size.height * 0.3500000);
    path_0.cubicTo(
        size.width * 0.9377377,
        size.height * 0.3500000,
        size.width * 0.8933000,
        size.height * 0.4188781,
        size.width * 0.8933000,
        size.height * 0.5038469);
    path_0.cubicTo(
        size.width * 0.8933000,
        size.height * 0.5888125,
        size.width * 0.9377377,
        size.height * 0.6576937,
        size.width * 0.9925551,
        size.height * 0.6576937);
    path_0.cubicTo(
        size.width * 0.9950594,
        size.height * 0.6576937,
        size.width * 0.9975420,
        size.height * 0.6575500,
        size.width,
        size.height * 0.6572656);
    path_0.lineTo(size.width, size.height * 0.9313469);
    path_0.cubicTo(size.width, size.height * 0.9692625, size.width * 0.9857449,
        size.height, size.width * 0.9681609, size.height);
    path_0.lineTo(size.width * 0.03183928, size.height);
    path_0.cubicTo(size.width * 0.01425494, size.height, 0,
        size.height * 0.9692625, 0, size.height * 0.9313469);
    path_0.lineTo(0, size.height * 0.6571125);
    path_0.cubicTo(
        size.width * 0.05075232,
        size.height * 0.6502969,
        size.width * 0.09057493,
        size.height * 0.5842781,
        size.width * 0.09057493,
        size.height * 0.5038469);
    path_0.cubicTo(
        size.width * 0.09057493,
        size.height * 0.4234125,
        size.width * 0.05075232,
        size.height * 0.3573969,
        0,
        size.height * 0.3505813);
    path_0.lineTo(0, size.height * 0.06865344);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.06865344);
    path_1.cubicTo(0, size.height * 0.03073713, size.width * 0.01425490, 0,
        size.width * 0.03183913, 0);
    path_1.lineTo(size.width * 0.9681609, 0);
    path_1.cubicTo(size.width * 0.9857449, 0, size.width,
        size.height * 0.03073713, size.width, size.height * 0.06865344);
    path_1.lineTo(size.width, size.height * 0.3504250);
    path_1.cubicTo(
        size.width * 0.9975420,
        size.height * 0.3501437,
        size.width * 0.9950594,
        size.height * 0.3500000,
        size.width * 0.9925551,
        size.height * 0.3500000);
    path_1.cubicTo(
        size.width * 0.9377377,
        size.height * 0.3500000,
        size.width * 0.8933000,
        size.height * 0.4188781,
        size.width * 0.8933000,
        size.height * 0.5038469);
    path_1.cubicTo(
        size.width * 0.8933000,
        size.height * 0.5888125,
        size.width * 0.9377377,
        size.height * 0.6576937,
        size.width * 0.9925551,
        size.height * 0.6576937);
    path_1.cubicTo(
        size.width * 0.9950594,
        size.height * 0.6576937,
        size.width * 0.9975420,
        size.height * 0.6575500,
        size.width,
        size.height * 0.6572656);
    path_1.lineTo(size.width, size.height * 0.9313469);
    path_1.cubicTo(size.width, size.height * 0.9692625, size.width * 0.9857449,
        size.height, size.width * 0.9681609, size.height);
    path_1.lineTo(size.width * 0.03183928, size.height);
    path_1.cubicTo(size.width * 0.01425494, size.height, 0,
        size.height * 0.9692625, 0, size.height * 0.9313469);
    path_1.lineTo(0, size.height * 0.6571125);
    path_1.cubicTo(
        size.width * 0.05075232,
        size.height * 0.6502969,
        size.width * 0.09057493,
        size.height * 0.5842781,
        size.width * 0.09057493,
        size.height * 0.5038469);
    path_1.cubicTo(
        size.width * 0.09057493,
        size.height * 0.4234125,
        size.width * 0.05075232,
        size.height * 0.3573969,
        0,
        size.height * 0.3505813);
    path_1.lineTo(0, size.height * 0.06865344);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width, size.height * 0.3504250);
    path_2.lineTo(size.width * 0.9996145, size.height * 0.3660281);
    path_2.lineTo(size.width * 1.007246, size.height * 0.3669062);
    path_2.lineTo(size.width * 1.007246, size.height * 0.3504250);
    path_2.lineTo(size.width, size.height * 0.3504250);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.6572656);
    path_2.lineTo(size.width * 1.007246, size.height * 0.6572656);
    path_2.lineTo(size.width * 1.007246, size.height * 0.6407844);
    path_2.lineTo(size.width * 0.9996145, size.height * 0.6416625);
    path_2.lineTo(size.width, size.height * 0.6572656);
    path_2.close();
    path_2.moveTo(0, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.0004504406, size.height * 0.6415188);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.6424313);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.6571125);
    path_2.lineTo(0, size.height * 0.6571125);
    path_2.close();
    path_2.moveTo(0, size.height * 0.3505813);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.3505813);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.3652625);
    path_2.lineTo(size.width * -0.0004504435, size.height * 0.3661750);
    path_2.lineTo(0, size.height * 0.3505813);
    path_2.close();
    path_2.moveTo(size.width * 0.03183913, size.height * -0.01562500);
    path_2.cubicTo(
        size.width * 0.02655290,
        size.height * -0.01562500,
        size.width * 0.02149435,
        size.height * -0.01335350,
        size.width * 0.01687580,
        size.height * -0.009223781);
    path_2.lineTo(size.width * 0.02242725, size.height * 0.01964266);
    path_2.cubicTo(
        size.width * 0.02531696,
        size.height * 0.01705888,
        size.width * 0.02849130,
        size.height * 0.01562500,
        size.width * 0.03183913,
        size.height * 0.01562500);
    path_2.lineTo(size.width * 0.03183913, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * -0.004277696, size.height * 0.03638844);
    path_2.cubicTo(
        size.width * -0.006192928,
        size.height * 0.04634719,
        size.width * -0.007246377,
        size.height * 0.05725469,
        size.width * -0.007246377,
        size.height * 0.06865344);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.06865344);
    path_2.cubicTo(
        size.width * 0.007246377,
        size.height * 0.06143437,
        size.width * 0.007911362,
        size.height * 0.05458969,
        size.width * 0.009109638,
        size.height * 0.04835875);
    path_2.lineTo(size.width * -0.004277696, size.height * 0.03638844);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.06865344);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.1038941);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.1038941);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.06865344);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.06865344);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.1743759);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.2448575);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.2448575);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.1743759);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.1743759);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.3153406);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.3505813);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.3505813);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.3153406);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.3153406);
    path_2.close();
    path_2.moveTo(size.width * -0.0004504435, size.height * 0.3661750);
    path_2.cubicTo(
        size.width * 0.004622101,
        size.height * 0.3668562,
        size.width * 0.009572536,
        size.height * 0.3681594,
        size.width * 0.01436848,
        size.height * 0.3700344);
    path_2.lineTo(size.width * 0.01695290, size.height * 0.3392844);
    path_2.cubicTo(
        size.width * 0.01159675,
        size.height * 0.3371938,
        size.width * 0.006084130,
        size.height * 0.3357406,
        size.width * 0.0004504435,
        size.height * 0.3349844);
    path_2.lineTo(size.width * -0.0004504435, size.height * 0.3661750);
    path_2.close();
    path_2.moveTo(size.width * 0.04257725, size.height * 0.3892250);
    path_2.cubicTo(
        size.width * 0.05198058,
        size.height * 0.3987812,
        size.width * 0.06007159,
        size.height * 0.4107875,
        size.width * 0.06649739,
        size.height * 0.4244531);
    path_2.lineTo(size.width * 0.07667449, size.height * 0.4022062);
    path_2.cubicTo(
        size.width * 0.06895652,
        size.height * 0.3857906,
        size.width * 0.05947014,
        size.height * 0.3718437,
        size.width * 0.04875551,
        size.height * 0.3609562);
    path_2.lineTo(size.width * 0.04257725, size.height * 0.3892250);
    path_2.close();
    path_2.moveTo(size.width * 0.08129043, size.height * 0.4749500);
    path_2.cubicTo(
        size.width * 0.08262826,
        size.height * 0.4842844,
        size.width * 0.08332855,
        size.height * 0.4939469,
        size.width * 0.08332855,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.09782130, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.09782130,
        size.height * 0.4907281,
        size.width * 0.09689101,
        size.height * 0.4779625,
        size.width * 0.09513710,
        size.height * 0.4657219);
    path_2.lineTo(size.width * 0.08129043, size.height * 0.4749500);
    path_2.close();
    path_2.moveTo(size.width * 0.08332855, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.08332855,
        size.height * 0.5137469,
        size.width * 0.08262826,
        size.height * 0.5234062,
        size.width * 0.08129043,
        size.height * 0.5327437);
    path_2.lineTo(size.width * 0.09513710, size.height * 0.5419687);
    path_2.cubicTo(
        size.width * 0.09689101,
        size.height * 0.5297312,
        size.width * 0.09782130,
        size.height * 0.5169625,
        size.width * 0.09782130,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.08332855, size.height * 0.5038469);
    path_2.close();
    path_2.moveTo(size.width * 0.06649739, size.height * 0.5832375);
    path_2.cubicTo(
        size.width * 0.06007159,
        size.height * 0.5969062,
        size.width * 0.05198058,
        size.height * 0.6089125,
        size.width * 0.04257725,
        size.height * 0.6184688);
    path_2.lineTo(size.width * 0.04875536, size.height * 0.6467375);
    path_2.cubicTo(
        size.width * 0.05947014,
        size.height * 0.6358469,
        size.width * 0.06895652,
        size.height * 0.6219031,
        size.width * 0.07667449,
        size.height * 0.6054875);
    path_2.lineTo(size.width * 0.06649739, size.height * 0.5832375);
    path_2.close();
    path_2.moveTo(size.width * 0.01436848, size.height * 0.6376563);
    path_2.cubicTo(
        size.width * 0.009572536,
        size.height * 0.6395312,
        size.width * 0.004622101,
        size.height * 0.6408375,
        size.width * -0.0004504406,
        size.height * 0.6415188);
    path_2.lineTo(size.width * 0.0004504406, size.height * 0.6727062);
    path_2.cubicTo(
        size.width * 0.006084130,
        size.height * 0.6719500,
        size.width * 0.01159675,
        size.height * 0.6705000,
        size.width * 0.01695290,
        size.height * 0.6684062);
    path_2.lineTo(size.width * 0.01436848, size.height * 0.6376563);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.6913906);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.6913906);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.6571125);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.7599500);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.8285094);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.8285094);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.7599500);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.7599500);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.8970687);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.9313469);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.9313469);
    path_2.lineTo(size.width * 0.007246377, size.height * 0.8970687);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.8970687);
    path_2.close();
    path_2.moveTo(size.width * -0.007246377, size.height * 0.9313469);
    path_2.cubicTo(
        size.width * -0.007246377,
        size.height * 0.9427469,
        size.width * -0.006192928,
        size.height * 0.9536531,
        size.width * -0.004277681,
        size.height * 0.9636125);
    path_2.lineTo(size.width * 0.009109652, size.height * 0.9516406);
    path_2.cubicTo(
        size.width * 0.007911362,
        size.height * 0.9454094,
        size.width * 0.007246377,
        size.height * 0.9385656,
        size.width * 0.007246377,
        size.height * 0.9313469);
    path_2.lineTo(size.width * -0.007246377, size.height * 0.9313469);
    path_2.close();
    path_2.moveTo(size.width * 0.01687580, size.height * 1.009225);
    path_2.cubicTo(
        size.width * 0.02149435,
        size.height * 1.013353,
        size.width * 0.02655290,
        size.height * 1.015625,
        size.width * 0.03183928,
        size.height * 1.015625);
    path_2.lineTo(size.width * 0.03183928, size.height * 0.9843750);
    path_2.cubicTo(
        size.width * 0.02849130,
        size.height * 0.9843750,
        size.width * 0.02531696,
        size.height * 0.9829406,
        size.width * 0.02242739,
        size.height * 0.9803563);
    path_2.lineTo(size.width * 0.01687580, size.height * 1.009225);
    path_2.close();
    path_2.moveTo(size.width * 0.03183928, size.height * 1.015625);
    path_2.lineTo(size.width * 0.04646928, size.height * 1.015625);
    path_2.lineTo(size.width * 0.04646928, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.03183928, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.03183928, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.07572928, size.height * 1.015625);
    path_2.lineTo(size.width * 0.1049894, size.height * 1.015625);
    path_2.lineTo(size.width * 0.1049894, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.07572928, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.07572928, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.1342494, size.height * 1.015625);
    path_2.lineTo(size.width * 0.1635101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.1635101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.1342494, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.1342494, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.1927696, size.height * 1.015625);
    path_2.lineTo(size.width * 0.2220290, size.height * 1.015625);
    path_2.lineTo(size.width * 0.2220290, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.1927696, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.1927696, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.2512899, size.height * 1.015625);
    path_2.lineTo(size.width * 0.2805493, size.height * 1.015625);
    path_2.lineTo(size.width * 0.2805493, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.2512899, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.2512899, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.3098101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.3390696, size.height * 1.015625);
    path_2.lineTo(size.width * 0.3390696, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.3098101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.3098101, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.3683304, size.height * 1.015625);
    path_2.lineTo(size.width * 0.3975899, size.height * 1.015625);
    path_2.lineTo(size.width * 0.3975899, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.3683304, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.3683304, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.4268493, size.height * 1.015625);
    path_2.lineTo(size.width * 0.4561101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.4561101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.4268493, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.4268493, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.4853696, size.height * 1.015625);
    path_2.lineTo(size.width * 0.5146304, size.height * 1.015625);
    path_2.lineTo(size.width * 0.5146304, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.4853696, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.4853696, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.5438899, size.height * 1.015625);
    path_2.lineTo(size.width * 0.5731507, size.height * 1.015625);
    path_2.lineTo(size.width * 0.5731507, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.5438899, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.5438899, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.6024101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.6316710, size.height * 1.015625);
    path_2.lineTo(size.width * 0.6316710, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.6024101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.6024101, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.6609304, size.height * 1.015625);
    path_2.lineTo(size.width * 0.6901899, size.height * 1.015625);
    path_2.lineTo(size.width * 0.6901899, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.6609304, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.6609304, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.7194507, size.height * 1.015625);
    path_2.lineTo(size.width * 0.7487101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.7487101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.7194507, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.7194507, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.7779710, size.height * 1.015625);
    path_2.lineTo(size.width * 0.8072304, size.height * 1.015625);
    path_2.lineTo(size.width * 0.8072304, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.7779710, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.7779710, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.8364913, size.height * 1.015625);
    path_2.lineTo(size.width * 0.8657507, size.height * 1.015625);
    path_2.lineTo(size.width * 0.8657507, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.8364913, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.8364913, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.8950101, size.height * 1.015625);
    path_2.lineTo(size.width * 0.9242710, size.height * 1.015625);
    path_2.lineTo(size.width * 0.9242710, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.8950101, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.8950101, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.9535304, size.height * 1.015625);
    path_2.lineTo(size.width * 0.9681609, size.height * 1.015625);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.9535304, size.height * 0.9843750);
    path_2.lineTo(size.width * 0.9535304, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 0.9681609, size.height * 1.015625);
    path_2.cubicTo(
        size.width * 0.9734464,
        size.height * 1.015625,
        size.width * 0.9785058,
        size.height * 1.013353,
        size.width * 0.9831246,
        size.height * 1.009225);
    path_2.lineTo(size.width * 0.9775725, size.height * 0.9803563);
    path_2.cubicTo(
        size.width * 0.9746826,
        size.height * 0.9829406,
        size.width * 0.9715087,
        size.height * 0.9843750,
        size.width * 0.9681609,
        size.height * 0.9843750);
    path_2.lineTo(size.width * 0.9681609, size.height * 1.015625);
    path_2.close();
    path_2.moveTo(size.width * 1.004278, size.height * 0.9636125);
    path_2.cubicTo(
        size.width * 1.006193,
        size.height * 0.9536531,
        size.width * 1.007246,
        size.height * 0.9427469,
        size.width * 1.007246,
        size.height * 0.9313469);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.9313469);
    path_2.cubicTo(
        size.width * 0.9927536,
        size.height * 0.9385656,
        size.width * 0.9920884,
        size.height * 0.9454094,
        size.width * 0.9908899,
        size.height * 0.9516406);
    path_2.lineTo(size.width * 1.004278, size.height * 0.9636125);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.9313469);
    path_2.lineTo(size.width * 1.007246, size.height * 0.8970875);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.8970875);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.9313469);
    path_2.lineTo(size.width * 1.007246, size.height * 0.9313469);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.8285656);
    path_2.lineTo(size.width * 1.007246, size.height * 0.7600469);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.7600469);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.8285656);
    path_2.lineTo(size.width * 1.007246, size.height * 0.8285656);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.6915250);
    path_2.lineTo(size.width * 1.007246, size.height * 0.6572656);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.6572656);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.6915250);
    path_2.lineTo(size.width * 1.007246, size.height * 0.6915250);
    path_2.close();
    path_2.moveTo(size.width * 0.9996145, size.height * 0.6416625);
    path_2.cubicTo(
        size.width * 0.9990275,
        size.height * 0.6417312,
        size.width * 0.9984406,
        size.height * 0.6417906,
        size.width * 0.9978507,
        size.height * 0.6418406);
    path_2.lineTo(size.width * 0.9984290, size.height * 0.6730656);
    path_2.cubicTo(
        size.width * 0.9990826,
        size.height * 0.6730094,
        size.width * 0.9997348,
        size.height * 0.6729437,
        size.width * 1.000386,
        size.height * 0.6728688);
    path_2.lineTo(size.width * 0.9996145, size.height * 0.6416625);
    path_2.close();
    path_2.moveTo(size.width * 0.9943217, size.height * 0.6420406);
    path_2.cubicTo(
        size.width * 0.9937333,
        size.height * 0.6420594,
        size.width * 0.9931449,
        size.height * 0.6420687,
        size.width * 0.9925551,
        size.height * 0.6420687);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.6733187);
    path_2.cubicTo(
        size.width * 0.9932087,
        size.height * 0.6733187,
        size.width * 0.9938623,
        size.height * 0.6733094,
        size.width * 0.9945130,
        size.height * 0.6732906);
    path_2.lineTo(size.width * 0.9943217, size.height * 0.6420406);
    path_2.close();
    path_2.moveTo(size.width * 0.9925551, size.height * 0.6420687);
    path_2.cubicTo(
        size.width * 0.9871130,
        size.height * 0.6420687,
        size.width * 0.9817855,
        size.height * 0.6413531,
        size.width * 0.9766101,
        size.height * 0.6399812);
    path_2.lineTo(size.width * 0.9748435, size.height * 0.6710000);
    path_2.cubicTo(
        size.width * 0.9806072,
        size.height * 0.6725250,
        size.width * 0.9865246,
        size.height * 0.6733187,
        size.width * 0.9925551,
        size.height * 0.6733187);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.6420687);
    path_2.close();
    path_2.moveTo(size.width * 0.9459391, size.height * 0.6228875);
    path_2.cubicTo(
        size.width * 0.9356188,
        size.height * 0.6136969,
        size.width * 0.9266739,
        size.height * 0.6016375,
        size.width * 0.9195275,
        size.height * 0.5876281);
    path_2.lineTo(size.width * 0.9097783, size.height * 0.6107531);
    path_2.cubicTo(
        size.width * 0.9182957,
        size.height * 0.6274500,
        size.width * 0.9287101,
        size.height * 0.6413531,
        size.width * 0.9404058,
        size.height * 0.6517719);
    path_2.lineTo(size.width * 0.9459391, size.height * 0.6228875);
    path_2.close();
    path_2.moveTo(size.width * 0.9028710, size.height * 0.5346750);
    path_2.cubicTo(
        size.width * 0.9013464,
        size.height * 0.5247406,
        size.width * 0.9005464,
        size.height * 0.5144281,
        size.width * 0.9005464,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.8860536, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.8860536,
        size.height * 0.5178719,
        size.width * 0.8871174,
        size.height * 0.5314937,
        size.width * 0.8891116,
        size.height * 0.5444937);
    path_2.lineTo(size.width * 0.9028710, size.height * 0.5346750);
    path_2.close();
    path_2.moveTo(size.width * 0.9005464, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.9005464,
        size.height * 0.4932625,
        size.width * 0.9013464,
        size.height * 0.4829531,
        size.width * 0.9028710,
        size.height * 0.4730156);
    path_2.lineTo(size.width * 0.8891116, size.height * 0.4631969);
    path_2.cubicTo(
        size.width * 0.8871174,
        size.height * 0.4762000,
        size.width * 0.8860536,
        size.height * 0.4898219,
        size.width * 0.8860536,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.9005464, size.height * 0.5038469);
    path_2.close();
    path_2.moveTo(size.width * 0.9195275, size.height * 0.4200625);
    path_2.cubicTo(
        size.width * 0.9266739,
        size.height * 0.4060563,
        size.width * 0.9356188,
        size.height * 0.3939969,
        size.width * 0.9459391,
        size.height * 0.3848031);
    path_2.lineTo(size.width * 0.9404058, size.height * 0.3559219);
    path_2.cubicTo(
        size.width * 0.9287101,
        size.height * 0.3663375,
        size.width * 0.9182957,
        size.height * 0.3802437,
        size.width * 0.9097783,
        size.height * 0.3969406);
    path_2.lineTo(size.width * 0.9195275, size.height * 0.4200625);
    path_2.close();
    path_2.moveTo(size.width * 0.9766101, size.height * 0.3677094);
    path_2.cubicTo(
        size.width * 0.9817855,
        size.height * 0.3663406,
        size.width * 0.9871130,
        size.height * 0.3656250,
        size.width * 0.9925551,
        size.height * 0.3656250);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.3343750);
    path_2.cubicTo(
        size.width * 0.9865246,
        size.height * 0.3343750,
        size.width * 0.9806072,
        size.height * 0.3351688,
        size.width * 0.9748435,
        size.height * 0.3366938);
    path_2.lineTo(size.width * 0.9766101, size.height * 0.3677094);
    path_2.close();
    path_2.moveTo(size.width * 0.9925551, size.height * 0.3656250);
    path_2.cubicTo(
        size.width * 0.9931449,
        size.height * 0.3656250,
        size.width * 0.9937333,
        size.height * 0.3656344,
        size.width * 0.9943217,
        size.height * 0.3656500);
    path_2.lineTo(size.width * 0.9945130, size.height * 0.3344031);
    path_2.cubicTo(
        size.width * 0.9938623,
        size.height * 0.3343844,
        size.width * 0.9932087,
        size.height * 0.3343750,
        size.width * 0.9925551,
        size.height * 0.3343750);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.3656250);
    path_2.close();
    path_2.moveTo(size.width * 0.9978507, size.height * 0.3658531);
    path_2.cubicTo(
        size.width * 0.9984406,
        size.height * 0.3659031,
        size.width * 0.9990275,
        size.height * 0.3659625,
        size.width * 0.9996145,
        size.height * 0.3660281);
    path_2.lineTo(size.width * 1.000386, size.height * 0.3348219);
    path_2.cubicTo(
        size.width * 0.9997348,
        size.height * 0.3347500,
        size.width * 0.9990826,
        size.height * 0.3346844,
        size.width * 0.9984290,
        size.height * 0.3346281);
    path_2.lineTo(size.width * 0.9978507, size.height * 0.3658531);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.3504250);
    path_2.lineTo(size.width * 1.007246, size.height * 0.3152031);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.3152031);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.3504250);
    path_2.lineTo(size.width * 1.007246, size.height * 0.3504250);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.2447613);
    path_2.lineTo(size.width * 1.007246, size.height * 0.1743181);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.1743181);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.2447613);
    path_2.lineTo(size.width * 1.007246, size.height * 0.2447613);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.1038750);
    path_2.lineTo(size.width * 1.007246, size.height * 0.06865344);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.06865344);
    path_2.lineTo(size.width * 0.9927536, size.height * 0.1038750);
    path_2.lineTo(size.width * 1.007246, size.height * 0.1038750);
    path_2.close();
    path_2.moveTo(size.width * 1.007246, size.height * 0.06865344);
    path_2.cubicTo(
        size.width * 1.007246,
        size.height * 0.05725469,
        size.width * 1.006193,
        size.height * 0.04634719,
        size.width * 1.004278,
        size.height * 0.03638844);
    path_2.lineTo(size.width * 0.9908899, size.height * 0.04835875);
    path_2.cubicTo(
        size.width * 0.9920884,
        size.height * 0.05458969,
        size.width * 0.9927536,
        size.height * 0.06143437,
        size.width * 0.9927536,
        size.height * 0.06865344);
    path_2.lineTo(size.width * 1.007246, size.height * 0.06865344);
    path_2.close();
    path_2.moveTo(size.width * 0.9831246, size.height * -0.009223781);
    path_2.cubicTo(
        size.width * 0.9785058,
        size.height * -0.01335350,
        size.width * 0.9734464,
        size.height * -0.01562500,
        size.width * 0.9681609,
        size.height * -0.01562500);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.01562500);
    path_2.cubicTo(
        size.width * 0.9715087,
        size.height * 0.01562500,
        size.width * 0.9746826,
        size.height * 0.01705888,
        size.width * 0.9775725,
        size.height * 0.01964266);
    path_2.lineTo(size.width * 0.9831246, size.height * -0.009223781);
    path_2.close();
    path_2.moveTo(size.width * 0.9681609, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.9535304, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.9535304, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.9681609, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.9242710, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.8950101, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.8950101, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.9242710, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.9242710, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.8657507, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.8364899, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.8364899, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.8657507, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.8657507, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.8072304, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.7779710, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.7779710, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.8072304, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.8072304, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.7487101, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.7194507, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.7194507, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.7487101, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.7487101, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.6901899, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.6609304, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.6609304, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.6901899, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.6901899, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.6316696, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.6024101, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.6024101, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.6316696, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.6316696, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.5731507, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.5438899, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.5438899, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.5731507, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.5731507, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.5146304, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.4853696, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.4853696, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.5146304, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.5146304, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.4561101, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.4268493, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.4268493, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.4561101, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.4561101, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.3975899, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.3683290, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.3683290, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.3975899, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.3975899, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.3390696, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.3098101, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.3098101, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.3390696, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.3390696, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.2805493, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.2512899, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.2512899, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.2805493, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.2805493, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.2220290, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.1927696, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.1927696, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.2220290, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.2220290, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.1635087, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.1342493, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.1342493, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.1635087, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.1635087, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.1049891, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.07572913, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.07572913, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.1049891, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.1049891, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width * 0.04646913, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.03183913, size.height * -0.01562500);
    path_2.lineTo(size.width * 0.03183913, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.04646913, size.height * 0.01562500);
    path_2.lineTo(size.width * 0.04646913, size.height * -0.01562500);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.3504250);
    path_2.lineTo(size.width * 0.9992290, size.height * 0.3816312);
    path_2.lineTo(size.width * 1.014493, size.height * 0.3833875);
    path_2.lineTo(size.width * 1.014493, size.height * 0.3504250);
    path_2.lineTo(size.width, size.height * 0.3504250);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.6572656);
    path_2.lineTo(size.width * 1.014493, size.height * 0.6572656);
    path_2.lineTo(size.width * 1.014493, size.height * 0.6243062);
    path_2.lineTo(size.width * 0.9992290, size.height * 0.6260594);
    path_2.lineTo(size.width, size.height * 0.6572656);
    path_2.close();
    path_2.moveTo(0, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.0009008826, size.height * 0.6259219);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.6277469);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.6571125);
    path_2.lineTo(0, size.height * 0.6571125);
    path_2.close();
    path_2.moveTo(0, size.height * 0.3505813);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.3505813);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.3799438);
    path_2.lineTo(size.width * -0.0009008870, size.height * 0.3817687);
    path_2.lineTo(0, size.height * 0.3505813);
    path_2.close();
    path_2.moveTo(size.width * 0.03183913, size.height * -0.03125000);
    path_2.cubicTo(
        size.width * 0.02558362,
        size.height * -0.03125000,
        size.width * 0.01958304,
        size.height * -0.02855969,
        size.width * 0.01410003,
        size.height * -0.02365700);
    path_2.lineTo(size.width * 0.02520304, size.height * 0.03407594);
    path_2.cubicTo(
        size.width * 0.02722826,
        size.height * 0.03226500,
        size.width * 0.02946043,
        size.height * 0.03125000,
        size.width * 0.03183913,
        size.height * 0.03125000);
    path_2.lineTo(size.width * 0.03183913, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * -0.01097136, size.height * 0.03040322);
    path_2.cubicTo(
        size.width * -0.01324507,
        size.height * 0.04222594,
        size.width * -0.01449275,
        size.height * 0.05516469,
        size.width * -0.01449275,
        size.height * 0.06865344);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.06865344);
    path_2.cubicTo(
        size.width * 0.01449275,
        size.height * 0.06352406,
        size.width * 0.01496348,
        size.height * 0.05871094,
        size.width * 0.01580333,
        size.height * 0.05434406);
    path_2.lineTo(size.width * -0.01097136, size.height * 0.03040322);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.06865344);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.1038941);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.1038941);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.06865344);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.06865344);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.1743759);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.2448575);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.2448575);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.1743759);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.1743759);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.3153406);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.3505813);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.3505813);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.3153406);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.3153406);
    path_2.close();
    path_2.moveTo(size.width * -0.0009008870, size.height * 0.3817687);
    path_2.cubicTo(
        size.width * 0.003891101,
        size.height * 0.3824125,
        size.width * 0.008560435,
        size.height * 0.3836438,
        size.width * 0.01307628,
        size.height * 0.3854094);
    path_2.lineTo(size.width * 0.01824507, size.height * 0.3239125);
    path_2.cubicTo(
        size.width * 0.01260886,
        size.height * 0.3217094,
        size.width * 0.006815145,
        size.height * 0.3201844,
        size.width * 0.0009008870,
        size.height * 0.3193906);
    path_2.lineTo(size.width * -0.0009008870, size.height * 0.3817687);
    path_2.close();
    path_2.moveTo(size.width * 0.03948826, size.height * 0.4033594);
    path_2.cubicTo(
        size.width * 0.04823580,
        size.height * 0.4122469,
        size.width * 0.05562913,
        size.height * 0.4232844,
        size.width * 0.06140870,
        size.height * 0.4355781);
    path_2.lineTo(size.width * 0.08176304, size.height * 0.3910812);
    path_2.cubicTo(
        size.width * 0.07339899,
        size.height * 0.3732906,
        size.width * 0.06321493,
        size.height * 0.3583750,
        size.width * 0.05184449,
        size.height * 0.3468219);
    path_2.lineTo(size.width * 0.03948826, size.height * 0.4033594);
    path_2.close();
    path_2.moveTo(size.width * 0.07436696, size.height * 0.4795625);
    path_2.cubicTo(
        size.width * 0.07549696,
        size.height * 0.4874469,
        size.width * 0.07608217,
        size.height * 0.4955531,
        size.width * 0.07608217,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.1050677, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.1050677,
        size.height * 0.4891219,
        size.width * 0.1040223,
        size.height * 0.4748000,
        size.width * 0.1020604,
        size.height * 0.4611094);
    path_2.lineTo(size.width * 0.07436696, size.height * 0.4795625);
    path_2.close();
    path_2.moveTo(size.width * 0.07608217, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.07608217,
        size.height * 0.5121375,
        size.width * 0.07549696,
        size.height * 0.5202438,
        size.width * 0.07436696,
        size.height * 0.5281281);
    path_2.lineTo(size.width * 0.1020604, size.height * 0.5465813);
    path_2.cubicTo(
        size.width * 0.1040223,
        size.height * 0.5328938,
        size.width * 0.1050677,
        size.height * 0.5185719,
        size.width * 0.1050677,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.07608217, size.height * 0.5038469);
    path_2.close();
    path_2.moveTo(size.width * 0.06140870, size.height * 0.5721156);
    path_2.cubicTo(
        size.width * 0.05562899,
        size.height * 0.5844063,
        size.width * 0.04823580,
        size.height * 0.5954438,
        size.width * 0.03948826,
        size.height * 0.6043344);
    path_2.lineTo(size.width * 0.05184449, size.height * 0.6608688);
    path_2.cubicTo(
        size.width * 0.06321493,
        size.height * 0.6493156,
        size.width * 0.07339899,
        size.height * 0.6344000,
        size.width * 0.08176304,
        size.height * 0.6166125);
    path_2.lineTo(size.width * 0.06140870, size.height * 0.5721156);
    path_2.close();
    path_2.moveTo(size.width * 0.01307628, size.height * 0.6222844);
    path_2.cubicTo(
        size.width * 0.008560435,
        size.height * 0.6240469,
        size.width * 0.003891101,
        size.height * 0.6252781,
        size.width * -0.0009008826,
        size.height * 0.6259219);
    path_2.lineTo(size.width * 0.0009008826, size.height * 0.6883031);
    path_2.cubicTo(
        size.width * 0.006815130,
        size.height * 0.6875062,
        size.width * 0.01260886,
        size.height * 0.6859844,
        size.width * 0.01824507,
        size.height * 0.6837813);
    path_2.lineTo(size.width * 0.01307628, size.height * 0.6222844);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.6913906);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.6913906);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.6571125);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.6571125);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.7599500);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.8285094);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.8285094);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.7599500);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.7599500);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.8970687);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.9313469);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.9313469);
    path_2.lineTo(size.width * 0.01449275, size.height * 0.8970687);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.8970687);
    path_2.close();
    path_2.moveTo(size.width * -0.01449275, size.height * 0.9313469);
    path_2.cubicTo(
        size.width * -0.01449275,
        size.height * 0.9448344,
        size.width * -0.01324506,
        size.height * 0.9577750,
        size.width * -0.01097135,
        size.height * 0.9695969);
    path_2.lineTo(size.width * 0.01580333, size.height * 0.9456562);
    path_2.cubicTo(
        size.width * 0.01496348,
        size.height * 0.9412906,
        size.width * 0.01449275,
        size.height * 0.9364750,
        size.width * 0.01449275,
        size.height * 0.9313469);
    path_2.lineTo(size.width * -0.01449275, size.height * 0.9313469);
    path_2.close();
    path_2.moveTo(size.width * 0.01410009, size.height * 1.023656);
    path_2.cubicTo(
        size.width * 0.01958304,
        size.height * 1.028559,
        size.width * 0.02558377,
        size.height * 1.031250,
        size.width * 0.03183928,
        size.height * 1.031250);
    path_2.lineTo(size.width * 0.03183928, size.height * 0.9687500);
    path_2.cubicTo(
        size.width * 0.02946058,
        size.height * 0.9687500,
        size.width * 0.02722826,
        size.height * 0.9677344,
        size.width * 0.02520304,
        size.height * 0.9659250);
    path_2.lineTo(size.width * 0.01410009, size.height * 1.023656);
    path_2.close();
    path_2.moveTo(size.width * 0.03183928, size.height * 1.031250);
    path_2.lineTo(size.width * 0.04646928, size.height * 1.031250);
    path_2.lineTo(size.width * 0.04646928, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.03183928, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.03183928, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.07572928, size.height * 1.031250);
    path_2.lineTo(size.width * 0.1049894, size.height * 1.031250);
    path_2.lineTo(size.width * 0.1049894, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.07572928, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.07572928, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.1342494, size.height * 1.031250);
    path_2.lineTo(size.width * 0.1635101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.1635101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.1342494, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.1342494, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.1927696, size.height * 1.031250);
    path_2.lineTo(size.width * 0.2220290, size.height * 1.031250);
    path_2.lineTo(size.width * 0.2220290, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.1927696, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.1927696, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.2512899, size.height * 1.031250);
    path_2.lineTo(size.width * 0.2805493, size.height * 1.031250);
    path_2.lineTo(size.width * 0.2805493, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.2512899, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.2512899, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.3098101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.3390696, size.height * 1.031250);
    path_2.lineTo(size.width * 0.3390696, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.3098101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.3098101, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.3683304, size.height * 1.031250);
    path_2.lineTo(size.width * 0.3975899, size.height * 1.031250);
    path_2.lineTo(size.width * 0.3975899, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.3683304, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.3683304, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.4268493, size.height * 1.031250);
    path_2.lineTo(size.width * 0.4561101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.4561101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.4268493, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.4268493, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.4853696, size.height * 1.031250);
    path_2.lineTo(size.width * 0.5146304, size.height * 1.031250);
    path_2.lineTo(size.width * 0.5146304, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.4853696, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.4853696, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.5438899, size.height * 1.031250);
    path_2.lineTo(size.width * 0.5731507, size.height * 1.031250);
    path_2.lineTo(size.width * 0.5731507, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.5438899, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.5438899, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.6024101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.6316710, size.height * 1.031250);
    path_2.lineTo(size.width * 0.6316710, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.6024101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.6024101, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.6609304, size.height * 1.031250);
    path_2.lineTo(size.width * 0.6901899, size.height * 1.031250);
    path_2.lineTo(size.width * 0.6901899, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.6609304, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.6609304, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.7194507, size.height * 1.031250);
    path_2.lineTo(size.width * 0.7487101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.7487101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.7194507, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.7194507, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.7779710, size.height * 1.031250);
    path_2.lineTo(size.width * 0.8072304, size.height * 1.031250);
    path_2.lineTo(size.width * 0.8072304, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.7779710, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.7779710, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.8364913, size.height * 1.031250);
    path_2.lineTo(size.width * 0.8657507, size.height * 1.031250);
    path_2.lineTo(size.width * 0.8657507, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.8364913, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.8364913, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.8950101, size.height * 1.031250);
    path_2.lineTo(size.width * 0.9242710, size.height * 1.031250);
    path_2.lineTo(size.width * 0.9242710, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.8950101, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.8950101, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.9535304, size.height * 1.031250);
    path_2.lineTo(size.width * 0.9681609, size.height * 1.031250);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.9535304, size.height * 0.9687500);
    path_2.lineTo(size.width * 0.9535304, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 0.9681609, size.height * 1.031250);
    path_2.cubicTo(
        size.width * 0.9744159,
        size.height * 1.031250,
        size.width * 0.9804174,
        size.height * 1.028559,
        size.width * 0.9859000,
        size.height * 1.023656);
    path_2.lineTo(size.width * 0.9747971, size.height * 0.9659250);
    path_2.cubicTo(
        size.width * 0.9727725,
        size.height * 0.9677344,
        size.width * 0.9705391,
        size.height * 0.9687500,
        size.width * 0.9681609,
        size.height * 0.9687500);
    path_2.lineTo(size.width * 0.9681609, size.height * 1.031250);
    path_2.close();
    path_2.moveTo(size.width * 1.010971, size.height * 0.9695969);
    path_2.cubicTo(
        size.width * 1.013245,
        size.height * 0.9577750,
        size.width * 1.014493,
        size.height * 0.9448344,
        size.width * 1.014493,
        size.height * 0.9313469);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.9313469);
    path_2.cubicTo(
        size.width * 0.9855072,
        size.height * 0.9364750,
        size.width * 0.9850362,
        size.height * 0.9412906,
        size.width * 0.9841971,
        size.height * 0.9456562);
    path_2.lineTo(size.width * 1.010971, size.height * 0.9695969);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.9313469);
    path_2.lineTo(size.width * 1.014493, size.height * 0.8970875);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.8970875);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.9313469);
    path_2.lineTo(size.width * 1.014493, size.height * 0.9313469);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.8285656);
    path_2.lineTo(size.width * 1.014493, size.height * 0.7600469);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.7600469);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.8285656);
    path_2.lineTo(size.width * 1.014493, size.height * 0.8285656);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.6915250);
    path_2.lineTo(size.width * 1.014493, size.height * 0.6572656);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.6572656);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.6915250);
    path_2.lineTo(size.width * 1.014493, size.height * 0.6915250);
    path_2.close();
    path_2.moveTo(size.width * 0.9992290, size.height * 0.6260594);
    path_2.cubicTo(
        size.width * 0.9986754,
        size.height * 0.6261250,
        size.width * 0.9981188,
        size.height * 0.6261813,
        size.width * 0.9975623,
        size.height * 0.6262281);
    path_2.lineTo(size.width * 0.9987174, size.height * 0.6886781);
    path_2.cubicTo(
        size.width * 0.9994029,
        size.height * 0.6886187,
        size.width * 1.000088,
        size.height * 0.6885500,
        size.width * 1.000771,
        size.height * 0.6884719);
    path_2.lineTo(size.width * 0.9992290, size.height * 0.6260594);
    path_2.close();
    path_2.moveTo(size.width * 0.9942261, size.height * 0.6264188);
    path_2.cubicTo(
        size.width * 0.9936696,
        size.height * 0.6264344,
        size.width * 0.9931130,
        size.height * 0.6264437,
        size.width * 0.9925551,
        size.height * 0.6264437);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.6889437);
    path_2.cubicTo(
        size.width * 0.9932406,
        size.height * 0.6889437,
        size.width * 0.9939261,
        size.height * 0.6889312,
        size.width * 0.9946087,
        size.height * 0.6889125);
    path_2.lineTo(size.width * 0.9942261, size.height * 0.6264188);
    path_2.close();
    path_2.moveTo(size.width * 0.9925551, size.height * 0.6264437);
    path_2.cubicTo(
        size.width * 0.9874072,
        size.height * 0.6264437,
        size.width * 0.9823754,
        size.height * 0.6257656,
        size.width * 0.9774928,
        size.height * 0.6244719);
    path_2.lineTo(size.width * 0.9739609, size.height * 0.6865062);
    path_2.cubicTo(
        size.width * 0.9800174,
        size.height * 0.6881094,
        size.width * 0.9862304,
        size.height * 0.6889437,
        size.width * 0.9925551,
        size.height * 0.6889437);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.6264437);
    path_2.close();
    path_2.moveTo(size.width * 0.9487058, size.height * 0.6084469);
    path_2.cubicTo(
        size.width * 0.9390739,
        size.height * 0.5998687,
        size.width * 0.9308623,
        size.height * 0.5887313,
        size.width * 0.9244029,
        size.height * 0.5760688);
    path_2.lineTo(size.width * 0.9049043, size.height * 0.6223125);
    path_2.cubicTo(
        size.width * 0.9141072,
        size.height * 0.6403562,
        size.width * 0.9252565,
        size.height * 0.6551813,
        size.width * 0.9376406,
        size.height * 0.6662125);
    path_2.lineTo(size.width * 0.9487058, size.height * 0.6084469);
    path_2.close();
    path_2.moveTo(size.width * 0.9097507, size.height * 0.5297656);
    path_2.cubicTo(
        size.width * 0.9084609,
        size.height * 0.5213625,
        size.width * 0.9077928,
        size.height * 0.5127063,
        size.width * 0.9077928,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.8788072, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.8788072,
        size.height * 0.5195937,
        size.width * 0.8800014,
        size.height * 0.5348719,
        size.width * 0.8822333,
        size.height * 0.5494031);
    path_2.lineTo(size.width * 0.9097507, size.height * 0.5297656);
    path_2.close();
    path_2.moveTo(size.width * 0.9077928, size.height * 0.5038469);
    path_2.cubicTo(
        size.width * 0.9077928,
        size.height * 0.4949844,
        size.width * 0.9084609,
        size.height * 0.4863312,
        size.width * 0.9097507,
        size.height * 0.4779250);
    path_2.lineTo(size.width * 0.8822333, size.height * 0.4582875);
    path_2.cubicTo(
        size.width * 0.8800014,
        size.height * 0.4728219,
        size.width * 0.8788072,
        size.height * 0.4881000,
        size.width * 0.8788072,
        size.height * 0.5038469);
    path_2.lineTo(size.width * 0.9077928, size.height * 0.5038469);
    path_2.close();
    path_2.moveTo(size.width * 0.9244029, size.height * 0.4316250);
    path_2.cubicTo(
        size.width * 0.9308623,
        size.height * 0.4189625,
        size.width * 0.9390739,
        size.height * 0.4078250,
        size.width * 0.9487058,
        size.height * 0.3992438);
    path_2.lineTo(size.width * 0.9376406, size.height * 0.3414781);
    path_2.cubicTo(
        size.width * 0.9252565,
        size.height * 0.3525094,
        size.width * 0.9141072,
        size.height * 0.3673375,
        size.width * 0.9049043,
        size.height * 0.3853781);
    path_2.lineTo(size.width * 0.9244029, size.height * 0.4316250);
    path_2.close();
    path_2.moveTo(size.width * 0.9774928, size.height * 0.3832187);
    path_2.cubicTo(
        size.width * 0.9823754,
        size.height * 0.3819281,
        size.width * 0.9874072,
        size.height * 0.3812500,
        size.width * 0.9925551,
        size.height * 0.3812500);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.3187500);
    path_2.cubicTo(
        size.width * 0.9862304,
        size.height * 0.3187500,
        size.width * 0.9800174,
        size.height * 0.3195812,
        size.width * 0.9739609,
        size.height * 0.3211844);
    path_2.lineTo(size.width * 0.9774928, size.height * 0.3832187);
    path_2.close();
    path_2.moveTo(size.width * 0.9925551, size.height * 0.3812500);
    path_2.cubicTo(
        size.width * 0.9931130,
        size.height * 0.3812500,
        size.width * 0.9936696,
        size.height * 0.3812594,
        size.width * 0.9942261,
        size.height * 0.3812750);
    path_2.lineTo(size.width * 0.9946087, size.height * 0.3187781);
    path_2.cubicTo(
        size.width * 0.9939261,
        size.height * 0.3187594,
        size.width * 0.9932406,
        size.height * 0.3187500,
        size.width * 0.9925551,
        size.height * 0.3187500);
    path_2.lineTo(size.width * 0.9925551, size.height * 0.3812500);
    path_2.close();
    path_2.moveTo(size.width * 0.9975623, size.height * 0.3814656);
    path_2.cubicTo(
        size.width * 0.9981188,
        size.height * 0.3815125,
        size.width * 0.9986754,
        size.height * 0.3815688,
        size.width * 0.9992290,
        size.height * 0.3816312);
    path_2.lineTo(size.width * 1.000771, size.height * 0.3192219);
    path_2.cubicTo(
        size.width * 1.000088,
        size.height * 0.3191406,
        size.width * 0.9994029,
        size.height * 0.3190719,
        size.width * 0.9987174,
        size.height * 0.3190156);
    path_2.lineTo(size.width * 0.9975623, size.height * 0.3814656);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.3504250);
    path_2.lineTo(size.width * 1.014493, size.height * 0.3152031);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.3152031);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.3504250);
    path_2.lineTo(size.width * 1.014493, size.height * 0.3504250);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.2447613);
    path_2.lineTo(size.width * 1.014493, size.height * 0.1743181);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.1743181);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.2447613);
    path_2.lineTo(size.width * 1.014493, size.height * 0.2447613);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.1038750);
    path_2.lineTo(size.width * 1.014493, size.height * 0.06865344);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.06865344);
    path_2.lineTo(size.width * 0.9855072, size.height * 0.1038750);
    path_2.lineTo(size.width * 1.014493, size.height * 0.1038750);
    path_2.close();
    path_2.moveTo(size.width * 1.014493, size.height * 0.06865344);
    path_2.cubicTo(
        size.width * 1.014493,
        size.height * 0.05516469,
        size.width * 1.013245,
        size.height * 0.04222594,
        size.width * 1.010971,
        size.height * 0.03040319);
    path_2.lineTo(size.width * 0.9841971, size.height * 0.05434406);
    path_2.cubicTo(
        size.width * 0.9850362,
        size.height * 0.05871094,
        size.width * 0.9855072,
        size.height * 0.06352406,
        size.width * 0.9855072,
        size.height * 0.06865344);
    path_2.lineTo(size.width * 1.014493, size.height * 0.06865344);
    path_2.close();
    path_2.moveTo(size.width * 0.9859000, size.height * -0.02365700);
    path_2.cubicTo(
        size.width * 0.9804174,
        size.height * -0.02855969,
        size.width * 0.9744159,
        size.height * -0.03125000,
        size.width * 0.9681609,
        size.height * -0.03125000);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.03125000);
    path_2.cubicTo(
        size.width * 0.9705391,
        size.height * 0.03125000,
        size.width * 0.9727725,
        size.height * 0.03226500,
        size.width * 0.9747971,
        size.height * 0.03407594);
    path_2.lineTo(size.width * 0.9859000, size.height * -0.02365700);
    path_2.close();
    path_2.moveTo(size.width * 0.9681609, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.9535304, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.9535304, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.9681609, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.9681609, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.9242710, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.8950101, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.8950101, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.9242710, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.9242710, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.8657507, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.8364899, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.8364899, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.8657507, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.8657507, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.8072304, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.7779710, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.7779710, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.8072304, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.8072304, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.7487101, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.7194507, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.7194507, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.7487101, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.7487101, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.6901899, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.6609304, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.6609304, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.6901899, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.6901899, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.6316696, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.6024101, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.6024101, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.6316696, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.6316696, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.5731507, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.5438899, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.5438899, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.5731507, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.5731507, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.5146304, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.4853696, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.4853696, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.5146304, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.5146304, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.4561101, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.4268493, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.4268493, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.4561101, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.4561101, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.3975899, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.3683290, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.3683290, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.3975899, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.3975899, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.3390696, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.3098101, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.3098101, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.3390696, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.3390696, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.2805493, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.2512899, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.2512899, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.2805493, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.2805493, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.2220290, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.1927696, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.1927696, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.2220290, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.2220290, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.1635087, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.1342493, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.1342493, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.1635087, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.1635087, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.1049891, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.07572913, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.07572913, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.1049891, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.1049891, size.height * -0.03125000);
    path_2.close();
    path_2.moveTo(size.width * 0.04646913, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.03183913, size.height * -0.03125000);
    path_2.lineTo(size.width * 0.03183913, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.04646913, size.height * 0.03125000);
    path_2.lineTo(size.width * 0.04646913, size.height * -0.03125000);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffCF3135).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
