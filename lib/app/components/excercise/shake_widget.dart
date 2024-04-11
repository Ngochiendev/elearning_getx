import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  final Widget child;
  final double horizontalPadding;
  final double animationRange;
  final ShakeWidgetController controller;
  final Duration animationDuration;

  const ShakeWidget({
    required this.child,
    this.horizontalPadding = 30,
    this.animationRange = 24,
    required this.controller,
    this.animationDuration = const Duration(milliseconds: 500),
    Key? key,
  }) : super(key: key);

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: widget.animationDuration, vsync: this);
    widget.controller.setState(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: widget.animationRange).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });

    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: widget.animationRange),
          padding: EdgeInsets.only(left: offsetAnimation.value + widget.horizontalPadding, right: widget.horizontalPadding - offsetAnimation.value),
          child: widget.child,
        );
      },
    );
  }
}

class ShakeWidgetController {
  late _ShakeWidgetState _state;
  void setState(_ShakeWidgetState state) {
    _state = state;
  }

  Future<void> shake() {
    return _state.animationController.forward(from: 0.0);
  }
}
