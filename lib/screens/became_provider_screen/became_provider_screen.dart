import 'dart:io';
import 'package:Pax/blocs/provider_bloc.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/photo_profile/photo_profile.dart';
import 'package:Pax/models/Provider.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/finish_provider_tab.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
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
  TextEditingController _bio = TextEditingController();
  TextEditingController _rg = TextEditingController();
  bool isTouch = false;
  @override
  Widget build(BuildContext context) {
    bool isVoid = _lowerValue == 20 && _upperValue == 80 && !isTouch;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            PhotoProfile(),
            SizedBox(
              width: 30.0,
            ),
            SizedBox(width: 8.0),
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
                                color: isVoid
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Row(
                          children: <Widget>[
                            isVoid
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
        SizedBox(
          height: 10.0,
        ),
        TextInput(
          'Bio',
          'Insira uma descrição sobre você',
          true,
          (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
          TextInputType.text,
          3,
          focus: true,
          controller: _bio,
        ),
        TextInput(
          'RG',
          'RG',
          true,
          (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
          TextInputType.number,
          1,
          controller: _rg,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(3.0)),
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.cloud_upload,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      SizedBox(width: 8.0),
                      new Text('SELFIE COM O RG'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Button(
          buttonText: 'Finalizar',
          type: 'default',
          tapHandler: activeteButton()
              ? () {
                  setState(() {
                    Provider p = Provider(
                      bio: _bio.text,
                      maxPrice: _upperValue,
                      minPrice: _lowerValue,
                    );
                    p.name = "true";
                    BlocProvider.of<ProviderBloc>(context)
                        .createProvider
                        .add(p);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
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
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  bool activeteButton() {
    return _bio.text.isNotEmpty && _rg.text.isNotEmpty && isTouch;
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text("Faixa de preço para seus serviços",
                  style: Theme.of(context).textTheme.title),
              SizedBox(height: 10),
              Text(
                "Esse valor não precisa ser regra, você ainda pode negociar com seu cliente",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Min: R\$10.00',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          'Max: R\$200.00',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                  ]..add(
                      frs.RangeSlider(
                        min: 20.0,
                        max: 200.0,
                        lowerValue: _lowerValue,
                        upperValue: _upperValue,
                        divisions: 10,
                        showValueIndicator: true,
                        valueIndicatorFormatter: (int index, double value) {
                          String twoDecimals = value.toStringAsFixed(2);
                          return 'R\$ $twoDecimals';
                        },
                        onChanged:
                            (double newLowerValue, double newUpperValue) {
                          isTouch = true;
                          setState(() {
                            _lowerValue = newLowerValue;
                            _upperValue = newUpperValue;
                          });
                        },
                      ),
                    ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                buttonText: 'PRONTO',
                type: 'default',
                tapHandler: () => Navigator.pop(context),
                isSmall: false,
              )
            ]),
          ),
        );
      },
    );
  }
}
