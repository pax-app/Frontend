import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:Pax/blocs/user_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PhotoProfile extends StatefulWidget {
  @override
  _PhotoProfileState createState() => _PhotoProfileState();
}

class _PhotoProfileState extends State<PhotoProfile> {
  File _photo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).accentColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Theme.of(context).accentColor,
          ),
          child: StreamBuilder(
            stream: BlocProvider.of<UserBloc>(context).getPhoto,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: FileImage(
                        snapshot.data,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else
                return Container();
            },
          ),
        ),
        InkWell(
          onTap: () async {
            debugPrint(_photo.toString());
            var image =
                await ImagePicker.pickImage(source: ImageSource.gallery);
            setState(() {
              BlocProvider.of<UserBloc>(context).setPhoto.add(image);
            });
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              //image: DecorationImage(),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 3.0,
              ),
            ),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
