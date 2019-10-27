import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChatAddressBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _addressLength = 2;
    double _currentSheetHeight = 80 + 100 * _addressLength.toDouble();

    return BaseBottomSheet(
      modalHeight: _currentSheetHeight > 380 ? 380 : _currentSheetHeight,
      sheetBody: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
            ),
            child: Text(
              'Escolha o endereço para o prestador realizar o serviço',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: _addressLength,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Divider(height: 0, thickness: 1.2),
                    Material(
                      child: InkWell(
                        onTap: () => {print('foi')},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '72871-066 Rua 66 Número 16 Jardim Céu Azul Quadra 88',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
