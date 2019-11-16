import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DummyContent extends StatelessWidget {
  final double width;
  final double height;

  const DummyContent({
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700],
      highlightColor: Colors.grey[100],
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
