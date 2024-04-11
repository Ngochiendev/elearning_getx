import 'package:flutter/material.dart';

class MinigameButton extends StatefulWidget {
  const MinigameButton({
    // required this.width,
    // required this.height,
    required this.child,
    required this.onPress,
    Key? key,
  }) : super(key: key);
  // final double width;
  // final double height;
  final Widget child;
  final void Function() onPress;

  @override
  _MinigameButtonState createState() => _MinigameButtonState();
}

class _MinigameButtonState extends State<MinigameButton> with SingleTickerProviderStateMixin {
  int currentState = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onTapDown: (_) {
        setState(() {
          currentState = 1;
        });
      },
      onTapUp: (_) {
        setState(() {
          currentState = 0;
        });
      },
      onTapCancel: () {
        setState(() {
          currentState = 0;
        });
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: currentState == 1 ? 1.0 : 0.9, end: currentState == 1 ? 0.9 : 1.0),
        duration: Duration(milliseconds: 300),
        builder: (BuildContext context, double value, Widget? _) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..scale(value),
            child: widget.child,
          );
        },
      ),
    );
  }
}
