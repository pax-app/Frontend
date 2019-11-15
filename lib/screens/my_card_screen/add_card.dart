import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _addName = TextEditingController();
  var _addExpiration = MaskedTextController(mask: '00/00');
  var _addCVV = MaskedTextController(
    mask: '000',
  );
  var _addCard = MaskedTextController(mask: '0000 0000 0000 0000');
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    // debugPrint("Focus: " + _focus.hasFocus.toString());
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Cartão adicionado com sucesso!",
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  size: 100.0,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(height: 6),
                Button(
                  buttonText: 'OK',
                  type: 'default',
                  tapHandler: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  isSmall: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: WhiteAppBar('Adicionar Cartão', context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              CreditCardWidget(
                cardNumber: this._addCard.text,
                expiryDate: this._addExpiration.text,
                cardHolderName: this._addName.text.isEmpty
                    ? 'NOME DO TITULAR'
                    : this._addName.text.toUpperCase(),
                cvvCode: this._addCVV.text,
                showBackView: this._focus.hasFocus,
                cardbgColor: Color(0xff78AA43),
                height: 175.0,
                textStyle: TextStyle(
                  fontFamily: 'CardFont',
                  fontSize: 16,
                  color: Color(0xff4f4f4f),
                ),
                width: MediaQuery.of(context).size.width,
                animationDuration: Duration(milliseconds: 1000),
              ),
              SizedBox(height: 8),
              Container(
                child: Column(
                  children: <Widget>[
                    TextInput(
                      'Número do Cartão',
                      'Número do Cartão',
                      true,
                      (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
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
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
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
              SizedBox(height: 16),
              Button(
                buttonText: 'Adicionar',
                type: 'default',
                tapHandler: _addCard.text.length == 0 ||
                        _addCVV.text.length == 0 ||
                        _addExpiration.text.length == 0 ||
                        _addName.text.length == 0
                    ? null
                    : () {
                        _showDialog();
                      },
                isSmall: false,
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
