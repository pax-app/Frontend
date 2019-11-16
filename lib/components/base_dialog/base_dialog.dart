import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final Widget body;
  final double height;

  const BaseDialog({
    @required this.body,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: height,
        child: body,
      ),
    );
  }
}
