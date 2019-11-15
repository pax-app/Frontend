import 'package:flutter/material.dart';

class RedBubble extends StatelessWidget {
  final String content;
  final Function onTapHandler;

  const RedBubble({this.content, this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
          color: Theme.of(context).errorColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            content,
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
