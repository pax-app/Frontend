import 'package:flutter/material.dart';

class ImageBubble extends StatefulWidget {
  final String image;

  const ImageBubble({this.image});

  @override
  _ImageBubbleState createState() => _ImageBubbleState();
}

class _ImageBubbleState extends State<ImageBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        widget.image,
        height: 200,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}
