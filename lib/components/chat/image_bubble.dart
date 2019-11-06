import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  final String path;

  const ImageFullScreen({this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'fullscreen',
            child: Image.network(
              path,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}

class ImageBubble extends StatelessWidget {
  final String image;
  final bool isMe;

  const ImageBubble({@required this.image, @required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      height: 200,
      width: 150,
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(9.0),
        child: GestureDetector(
          child: Image.network(
            image,
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
            width: 150,
            height: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: isMe
                        ? new AlwaysStoppedAnimation<Color>(Colors.white)
                        : new AlwaysStoppedAnimation<Color>(Colors.green),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                ),
              );
            },
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ImageFullScreen(
                path: image,
              );
            }));
          },
        ),
      ),
    );
  }
}
