import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class BecameProviderScreen extends StatefulWidget {
  @override
  _BecameProviderScreenState createState() => _BecameProviderScreenState();
}

class _BecameProviderScreenState extends State<BecameProviderScreen> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).accentColor, width: 2.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://studiosol-a.akamaihd.net/letras/500x500/fotos/2/5/7/4/2574f9070ce48b988fe2693a60c40427.jpg'),
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            SizedBox(width: 8.0),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Naruto Uzumaki",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.title.fontFamily,
                        fontSize: Theme.of(context).textTheme.title.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.title.fontWeight,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            border:
                                //Border.all(color: Theme.of(context).primaryColor),
                                Border.all(
                                    color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Row(
                          children: <Widget>[
                            // new Text('FAIXA DE PREÇO'),
                            new Text(
                              "  R\$ 20 - R\$ 120",
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
        TextInput('Bio', 'Insira uma descrição sobre você', true,
            (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.text, 3, focus: true),
        TextInput('RG', 'RG', true, (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        }, TextInputType.number, 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {},
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
          tapHandler: () {},
          isSmall: false,
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
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
                    children: <Widget>[]
                      ..add(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'R\$${_lowerValue.toStringAsFixed(2)}',
                             style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'R\$${_upperValue.toStringAsFixed(2)}',
                             style: Theme.of(context).textTheme.title,
                          ),
                        ],
                      ))
                      ..add(
                        frs.RangeSlider(
                          min: 0.0,
                          max: 100.0,
                          lowerValue: _lowerValue,
                          upperValue: _upperValue,
                          divisions: 20,

                          showValueIndicator: true,
                          valueIndicatorFormatter: (int index, double value) {
                            String twoDecimals = value.toStringAsFixed(2);
                            return 'R\$ $twoDecimals';
                          },
                          onChanged:
                              (double newLowerValue, double newUpperValue) {
                            setState(() {
                              _lowerValue = newLowerValue;
                              _upperValue = newUpperValue;
                              debugPrint(newLowerValue.toString());
                            });
                          },
                        ),
                      ),
                    ),
                ),
                SizedBox(height: 20,),
                Button(
                  buttonText: 'PRONTO',
                  type: 'default',
                  tapHandler: () {},
                  isSmall: false,
                )
              ]),
            ),
          );
        });
  }
}
