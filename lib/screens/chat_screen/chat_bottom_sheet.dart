import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
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
                onPressed: () {},
                child: Icon(
                  Icons.location_on,
                  color: colorWhite,
                  size: 30,
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
                onPressed: () {},
                shape: const CircleBorder(),
                child: Icon(
                  Icons.camera_alt,
                  color: colorWhite,
                  size: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Imagem',
                style: Theme.of(context).textTheme.subtitle,
              )
            ],
          )
        ],
      ),
    );
  }
}
