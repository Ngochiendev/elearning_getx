import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

class EggResult extends StatefulWidget {
  final EggResultController controller;

  const EggResult({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _EggResultState createState() => _EggResultState();
}

class _EggResultState extends State<EggResult> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  String resultImage = R.ASSETS_MINIGAME_IC_WIN_4_PNG;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    widget.controller.setResultState(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 28.0).chain(CurveTween(curve: Curves.easeIn)).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 1000)).then((value) => animationController.reverse());
        }
      });

    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (context, child) {
        return Container(
          child: Container(
            height: 100,
            width: 120,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 36,
                  left: 16,
                  child: Image.asset(
                    resultImage,
                    width: 58,
                    height: 58,
                  ),
                ),
                Positioned(
                  top: 0 - offsetAnimation.value,
                  child: Image.asset(
                    R.ASSETS_MINIGAME_IC_EGG_TOP_PNG,
                    width: 96,
                  ),
                ),
                Positioned(
                  top: 53 + offsetAnimation.value,
                  child: Image.asset(
                    R.ASSETS_MINIGAME_IC_EGG_BOTTOM_PNG,
                    width: 96,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EggResultController {
  late _EggResultState _state;
  void setResultState(_EggResultState state) {
    _state = state;
  }

  Future<void> showResult(bool isCorrect) {
    _state.setState(() {
      _state.resultImage = isCorrect ? R.ASSETS_MINIGAME_IC_WIN_4_PNG : R.ASSETS_MINIGAME_IC_LOST_4_PNG;
    });
    return _state.animationController.forward(from: 0.0);
  }
}
