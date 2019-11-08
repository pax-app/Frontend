import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  final double modalHeight;
  final Widget sheetBody;
  static const baseRadius = const Radius.circular(60);
  final Curve curveAnimation;
  var duration;

  BaseBottomSheet({
    this.modalHeight = 320.0,
    @required this.sheetBody,
    this.curveAnimation = Curves.bounceOut,
    this.duration = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: modalHeight,
      curve: curveAnimation,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: const BorderRadius.only(
          topLeft: baseRadius,
          topRight: baseRadius,
        ),
      ),
      child: sheetBody,
    );
  }
}
