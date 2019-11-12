import 'dart:io';

import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPerfilTab extends StatefulWidget {
  @override
  _EditPerfilTabState createState() => _EditPerfilTabState();
}

class _EditPerfilTabState extends State<EditPerfilTab> {
  TextEditingController _name = TextEditingController();
  File _photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              _photo == null
                  ? Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  : Container(
                      height: 140,
                      width: 120,
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
              InkWell(
                onTap: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _photo = image;
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
          ),
        ),
        TextInput(
          'Nome',
          'Seu nome',
          true,
          (String value) {
            return _name.text.isEmpty ? 'Texto Vazio' : null;
          },
          TextInputType.text,
          1,
          controller: _name,
          focus: true,
        ),
        SizedBox(
          height: 150.0,
        ),
        Button(
          buttonText: 'Salvar',
          type: 'default',
          tapHandler: null,
          isSmall: false,
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
