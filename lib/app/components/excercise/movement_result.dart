import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

class MovementResult extends StatefulWidget {
  final MovementResultController controller;

  const MovementResult({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _MovementResultState createState() => _MovementResultState();
}

class _MovementResultState extends State<MovementResult> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  String resultImage = "";

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    widget.controller.setResultState(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 1000)).then((value) {
            animationController.reset();
            setState(() {
              resultImage = "";
            });
          });
        }
      });

    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (context, child) {
        return Positioned(
          top: 90 - (offsetAnimation.value * 180),
          left: MediaQuery.of(context).size.width * 0.3 - 80 - (MediaQuery.of(context).size.width * 0.35 * offsetAnimation.value),
          child: resultImage.isNotEmpty
              ? Image.asset(
                  resultImage,
                  width: 64,
                )
              : Container(),
        );
      },
    );
  }
}

class MovementResultController {
  late _MovementResultState _state;
  void setResultState(_MovementResultState state) {
    _state = state;
  }

  showResult(bool? isCorrect) {
    if (isCorrect != null) {
      _state.setState(() {
        _state.resultImage = isCorrect ? R.ASSETS_MINIGAME_IC_WIN_1_PNG : R.ASSETS_MINIGAME_IC_LOST_1_PNG;
      });
      return _state.animationController.forward(from: 0.0);
    } else {
      _state.setState(() {
        _state.resultImage = "";
      });
    }
  }
}
