import 'package:flutter/material.dart';

class PhotoProfile extends StatefulWidget {
  @override
  _PhotoProfileState createState() => _PhotoProfileState();
}

class _PhotoProfileState extends State<PhotoProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _photo == null
          ? Container()
          : Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).accentColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.transparent,
                image: DecorationImage(
                  image: FileImage(
                    _photo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
