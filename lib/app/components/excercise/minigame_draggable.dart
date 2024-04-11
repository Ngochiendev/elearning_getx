import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

class MinigameDraggable extends StatefulWidget {
  const MinigameDraggable({
    required this.data,
    required this.size,
    Key? key,
  }) : super(key: key);

  final String data;
  final double size;

  @override
  _MinigameDraggableState createState() => _MinigameDraggableState();
}

class _MinigameDraggableState extends State<MinigameDraggable> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.data,
      feedback: Container(
        width: widget.size,
        height: widget.size,
        child: Image.asset(R.ASSETS_MINIGAME_BOX_PNG),
      ),
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Image.asset(R.ASSETS_MINIGAME_BOX_PNG),
      ),
      childWhenDragging: Container(
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
