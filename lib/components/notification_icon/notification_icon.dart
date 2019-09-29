import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final int _notificationNumber;
  NotificationIcon(this._notificationNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          this._notificationNumber.toString(),
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
