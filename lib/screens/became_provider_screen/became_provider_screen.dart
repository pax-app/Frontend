import 'dart:io';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/finish_provider_tab.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/provider_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:image_picker/image_picker.dart';
import "package:Pax/blocs/became_provider_bloc.dart";

final _becameProviderBloc = BecameProviderBloc();

class BecameProviderScreen extends StatefulWidget {
  @override
  _BecameProviderScreenState createState() => _BecameProviderScreenState();
}

class _BecameProviderScreenState extends State<BecameProviderScreen> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  bool isTouch = false;
  var _photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                _photo == null
                    ? Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    : Container(
                        height: 140,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 2.0,
                          ),
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
                InkWell(
                  onTap: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      _photo = image;
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 3.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 30.0),
            const SizedBox(width: 8.0),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    StreamBuilder<Object>(
                        stream: _becameProviderBloc.name,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.hasData ? snapshot.data : "",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily:
                                  Theme.of(context).textTheme.title.fontFamily,
                              fontSize:
                                  Theme.of(context).textTheme.title.fontSize,
                              fontWeight:
                                  Theme.of(context).textTheme.title.fontWeight,
                              color: Theme.of(context).textTheme.title.color,
                            ),
                          );
                        }),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: !isTouch
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Row(
                          children: <Widget>[
                            !isTouch
                                ? Text('FAIXA DE PREÇO')
                                : Text(
                                    "R\$${_lowerValue.toStringAsFixed(2)} - R\$${_upperValue.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 10.0),
        TextInput(
          'Bio',
          'Insira uma descrição sobre você',
          true,
          TextInputType.text,
          3,
          focus: true,
          stream: _becameProviderBloc.bio,
          onChanged: _becameProviderBloc.changeBio,
        ),
        TextInput(
          'RG',
          'RG',
          true,
          TextInputType.text,
          1,
          stream: _becameProviderBloc.rg,
          onChanged: _becameProviderBloc.changeRg,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  File _image;
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.cloud_upload,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      const SizedBox(width: 8.0),
                      new Text('SELFIE COM O RG'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Button(
          buttonText: 'Finalizar',
          type: 'default',
          tapHandler: activeteButton()
              ? () {
                  _becameProviderBloc.turnIntoProvider(
                      _lowerValue, _upperValue);
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => BaseScreen(
                        "",
                        "Agora é só aguardar",
                        FinishProviderTab(),
                        null,
                      ),
                    ),
                  );
                }
              : null,
          isSmall: false,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  bool activeteButton() {
    return isTouch;
  }

  void _updatePriceRange(double newLowerValue, double newUpperValue) {
    setState(() {
      _lowerValue = newLowerValue;
      _upperValue = newUpperValue;
      isTouch = true;
    });
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ProviderBottomSheet(
          lowerValue: _lowerValue,
          upperValue: _upperValue,
          updatePriceRange: _updatePriceRange,
        );
      },
    );
  }
}
