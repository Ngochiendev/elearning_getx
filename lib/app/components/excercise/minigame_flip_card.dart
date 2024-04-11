import 'dart:async';
import 'dart:math';

import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class MinigameFlipCard extends StatefulWidget {
  const MinigameFlipCard({
    required this.child,
    required this.value,
    required this.eventBus,
    required this.onToggleCard,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Sets value;
  final EventBus eventBus;
  final void Function(bool) onToggleCard;

  @override
  _MinigameFlipCardState createState() => _MinigameFlipCardState();
}

class _MinigameFlipCardState extends State<MinigameFlipCard> {
  bool isBack = true;
  bool isLock = false;
  double angle = 0;
  StreamSubscription<EventMinigameFlipCardState>? stream;

  @override
  void initState() {
    super.initState();
    stream = widget.eventBus.on<EventMinigameFlipCardState>().listen((event) {
      if (event.value != widget.value) {
        return;
      }
      if (event.state == MiniGameFlipCardState.lock) {
        setState(() {
          isLock = true;
        });
      } else if (event.state == MiniGameFlipCardState.reset) {
        if (!isBack) {
          setState(() {
            angle = 0;
          });
        }
        isLock = false;
        isBack = true;
      } else if (event.state == MiniGameFlipCardState.close) {
        setState(() {
          angle = 0;
        });
        isBack = true;
      }
    });
  }

  @override
  void dispose() {
    stream?.cancel();
    super.dispose();
  }

  void _flipCard() {
    setState(() {
      angle = (angle + pi) % (pi * 2);
    });
    widget.onToggleCard(angle > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          if (!isLock) {
            _flipCard();
          }
        },
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: angle),
            duration: Duration(milliseconds: 300),
            builder: (BuildContext context, double value, Widget? _) {
              isBack = value < pi / 2;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(value),
                child: isBack
                    ? Image.asset(
                        R.ASSETS_MINIGAME_BOX_MATCHED_PNG,
                        height: (MediaQuery.of(context).size.height - 180) / 2,
                      )
                    : Stack(
                        children: [
                          Image.asset(
                            isLock ? R.ASSETS_MINIGAME_BOX_PNG : R.ASSETS_MINIGAME_BOX_MATCHED_PNG,
                            width: (MediaQuery.of(context).size.height - 180) / 2,
                            height: (MediaQuery.of(context).size.height - 180) / 2,
                          ),
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(pi),
                            child: Container(
                              width: (MediaQuery.of(context).size.height - 180) / 2,
                              height: (MediaQuery.of(context).size.height - 180) / 2,
                              alignment: Alignment.center,
                              child: widget.child,
                            ),
                          )
                        ],
                      ),
              );
            }),
      ),
    );
  }
}
