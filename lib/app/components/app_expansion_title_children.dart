import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';

class AppExpansionTileChildren extends StatefulWidget {
  final Widget title;
  final Color? color;
  final bool? initiallyExpanded;
  final List<Widget> children;
  const AppExpansionTileChildren(
      {required this.title,
      required this.children,
      this.color,
      this.initiallyExpanded,
      Key? key})
      : super(key: key);

  @override
  _AppExpansionTileState createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTileChildren>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    _rotationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      // decoration: decorContainerBox.copyWith(color: widget.color),
      child: ExpansionTile(
        title: widget.title,
        children: widget.children,
        collapsedTextColor: colorNeutralGray100,
        collapsedIconColor: colorNeutralGray100,
        iconColor: colorNeutralGray100,
        textColor: colorNeutralGray100,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        initiallyExpanded: widget.initiallyExpanded ?? false,
        trailing: RotationTransition(
          turns: Tween(begin: 0.0, end: 0.5).animate(_rotationController),
          child: SvgPicture.asset(R.ASSETS_SVG_IC_ARROW_DOWN_SVG),
        ),
        onExpansionChanged: (value) {
          if (value) {
            _rotationController.forward();
          } else {
            _rotationController.reverse();
          }
        },
      ),
    );
  }
}
