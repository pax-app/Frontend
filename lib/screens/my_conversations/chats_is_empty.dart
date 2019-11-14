import 'package:flutter/material.dart';

class ChatsIsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      alignment: Alignment.center,
      child: Container(
        height: 180,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.speaker_notes_off,
              size: 42,
            ),
            SizedBox(height: 15),
            Text(
              'Você não tem conversas',
              style: Theme.of(context).textTheme.subtitle,
            )
          ],
        ),
      ),
    );
  }
}
