import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/button%20/button.dart';
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
  TextEditingController _addExpiration = TextEditingController();
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
          height: 165.0,
          textStyle:
              TextStyle(fontFamily: 'OCR-A', fontSize: 18, color: Colors.white),
          width: MediaQuery.of(context).size.width,
          animationDuration: Duration(milliseconds: 1000),
        ),
        Container(
          child: Column(
            children: <Widget>[
              TextInput(
                'Número do Cartão',
                'Número do Cartão',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
                TextInputType.number,
                1,
                focus: true,
                controller: _addCard,
              ),
              TextInput(
                'Nome do Titular',
                'Nome do Titular',
                true,
                (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
                TextInputType.text,
                1,
                focus: true,
                controller: _addName,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    child: TextInput(
                      'Expiração',
                      'Expiração do Cartão',
                      true,
                      (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                      TextInputType.text,
                      1,
                      focus: true,
                      controller: _addExpiration,
                    ),
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.1,
                  // ),
                  SizedBox(
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
                    width: MediaQuery.of(context).size.width * 0.39,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Button(
          buttonText: 'Adicionar Cartão',
          type: 'default',
          tapHandler: _addCard.text.length == 0 ||
                  _addCVV.text.length == 0 ||
                  _addExpiration.text.length == 0 ||
                  _addName.text.length == 0
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BaseScreen(
                        "Cartões",
                        "Cartão ${_addCard.text} Cadastrado com Sucesso",
                        null,
                        null,
                      ),
                    ),
                  );
                },
          isSmall: false,
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    ));
  }
}
