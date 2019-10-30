import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  final double modalHeight;
  final Widget sheetBody;
  static const baseRadius = const Radius.circular(40);

  BaseBottomSheet({
    this.modalHeight = 320.0,
    @required this.sheetBody,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: modalHeight,
      curve: Curves.bounceOut,
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
