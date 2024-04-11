import 'dart:async';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class MinigameBoxOption extends StatefulWidget {
  const MinigameBoxOption({
    required this.child,
    required this.value,
    required this.eventBus,
    required this.onChoose,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Sets value;
  final EventBus eventBus;
  final void Function(Sets, bool) onChoose;

  @override
  _MinigameBoxOptionState createState() => _MinigameBoxOptionState();
}

class _MinigameBoxOptionState extends State<MinigameBoxOption> {
  bool isChoose = false;
  bool isLock = false;
  StreamSubscription<EventMinigameChooseOptionState>? stream;

  @override
  void initState() {
    super.initState();
    stream = widget.eventBus.on<EventMinigameChooseOptionState>().listen((event) {
      if (event.value != widget.value) {
        return;
      }
      if (event.state == MinigameChooseOptionState.lock) {
        setState(() {
          isLock = true;
        });
      } else if (event.state == MinigameChooseOptionState.reset) {
        if (isChoose) {
          setState(() {
            isChoose = false;
            isLock = false;
          });
        }
      } else if (event.state == MinigameChooseOptionState.close) {
        setState(() {
          isChoose = false;
        });
      }
    });
  }

  @override
  void dispose() {
    stream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLock) {
          setState(() {
            isChoose = !isChoose;
          });
          widget.onChoose(widget.value, isChoose);
        }
      },
      child: Stack(
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: isChoose ? 1.0 : 1.2, end: isChoose ? 1.2 : 1.0),
              duration: Duration(milliseconds: 300),
              builder: (BuildContext context, double value, Widget? _) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..scale(value),
                  child: Stack(
                    children: [
                      Image.asset(
                        isChoose ? R.ASSETS_MINIGAME_BG_CARD_LISTEN_ACTIVE_PNG : R.ASSETS_MINIGAME_BG_CARD_LISTEN_PNG,
                        width: MediaQuery.of(context).size.height * 0.25,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.height * 0.25,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: widget.child,
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Color(0x01000000),
            ),
          ),
        ],
      ),
    );
  }
}
