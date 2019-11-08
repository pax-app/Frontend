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
  TextEditingController _addName = TextEditingController(text: ' ');
  var _addExpiration = MaskedTextController(mask: '00/00');
  var _addCVV = MaskedTextController(mask: '000');
  var _addCard = MaskedTextController(mask: '0000 0000 0000 0000');
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CreditCardWidget(
          cardNumber: this._addCard.text,
          expiryDate: this._addExpiration.text,
          cardHolderName: this._addName.text.toUpperCase(),
          cvvCode: this._addCVV.text,
          showBackView: this._focus.hasFocus,
          cardbgColor: Colors.green,
          height: 175.0,
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
                      TextInputType.number,
                      1,
                      focus: false,
                      controller: _addExpiration,
                    ),
                    width: MediaQuery.of(context).size.width * 0.498,
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
                      TextInputType.number,
                      1,
                      focus: true,
                      controller: _addCVV,
                      focusNd: _focus,
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
