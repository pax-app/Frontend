import 'package:Pax/components/button%20/button.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/text_input/text_input.dart';

class ProfileImageTab extends StatefulWidget {
  @override
  _ProfileImageTabState createState() => _ProfileImageTabState();
}

class _ProfileImageTabState extends State<ProfileImageTab> {
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
                    Container(
                      width: 130,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          border:
                              //Border.all(color: Theme.of(context).primaryColor),
                              Border.all(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Row(
                        children: <Widget>[
                          // new Text('FAIXA DE PREÇO'),
                          new Text(
                            "  R\$ 20 - R\$ 120",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    ),
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
}
