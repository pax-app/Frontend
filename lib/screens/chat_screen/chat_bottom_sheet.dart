import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  final Function cameraHandler;
  final Function galleryHandler;
  final Function addressHandler;

  const ChatBottomSheet({
    Key key,
    this.cameraHandler,
    this.galleryHandler,
    this.addressHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .12,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                padding: const EdgeInsets.all(20),
                shape: const CircleBorder(),
                onPressed: addressHandler,
                child: Icon(
                  Icons.location_on,
                  color: colorWhite,
                  size: 25,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Endereço',
                style: Theme.of(context).textTheme.subtitle,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                padding: const EdgeInsets.all(20),
                onPressed: cameraHandler,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.camera,
                  color: colorWhite,
                  size: 25,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Câmera',
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                padding: const EdgeInsets.all(20),
                onPressed: galleryHandler,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.photo_library,
                  color: colorWhite,
                  size: 25,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Galeria',
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
