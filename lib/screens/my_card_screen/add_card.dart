import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _addCard = TextEditingController();
  TextEditingController _addCVV = TextEditingController();
  TextEditingController _addName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CreditCardWidget(
          cardNumber: '4002 8922 9258 3457',
          expiryDate: '08/27',
          cardHolderName: 'Fepas Lindi Patrick Gato'.toUpperCase(),
          cvvCode: '123',
          showBackView: false, //back view
          cardbgColor: Colors.purple,
          height: 175.0,
          textStyle:
              TextStyle(fontFamily: 'OCR-A', fontSize: 18, color: Colors.white),
          width: MediaQuery.of(context).size.width,
          animationDuration: Duration(milliseconds: 1000),
        ),
        Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 185.0,
                child: TextInput(
                  'Número do Cartão',
                  'Número do Cartão',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _addCard,
                ),
              ),
              SizedBox(
                width: 15.0,
                height: 50.0,
              ),
              SizedBox(
                width: 120.0,
                child: TextInput(
                  'CVV',
                  'CVV do Cartão',
                  true,
                  (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                  TextInputType.text,
                  1,
                  focus: true,
                  controller: _addCVV,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          width: 400.0,
          child: TextInput(
            'Nome do Titular',
            'Nome como está no cartão',
            true,
            (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
            TextInputType.text,
            1,
            focus: true,
            controller: _addName,
          ),
        )
      ],
    ));
  }
}
