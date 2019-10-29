import 'package:Pax/screens/add_adress_screen/cep_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AdressScreen extends StatefulWidget {
  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  bool modalState = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: modalState == true
            ? showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CepBottomSheet();
                },
              )
            : Text('false'));
  }
}
