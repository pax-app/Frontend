import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ImageBubble extends StatelessWidget {
  final String image;
  final bool isMe;

  const ImageBubble({@required this.image, @required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      child: Center(
        child: Image.network(
          image,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor:
                    isMe ? colorWhite : Theme.of(context).accentColor,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
