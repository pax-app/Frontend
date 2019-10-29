import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAddressList extends StatelessWidget {
  final int addressLength;
  final addresses;
  final Function navigateToCepModal;

  const ChatAddressList({
    this.addressLength,
    this.addresses,
    this.navigateToCepModal,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addressLength,
      itemBuilder: (context, index) {
        bool isLast = index + 1 == addressLength;

        return Column(
          children: <Widget>[
            Divider(height: 1, thickness: 1.2),
            Material(
              child: InkWell(
                onTap:
                    isLast ? navigateToCepModal : () => _selectAddress(index),
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  child: Text(
                    isLast
                        ? 'ADICIONAR ENDEREÇO'
                        : '${addresses[index]['street']} Número ${addresses[index]['number']}, ${addresses[index]['neighborhood']} - CEP: ${addresses[index]['cep']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isLast ? Theme.of(context).accentColor : null,
                      height: isLast ? 2 : 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _selectAddress(int address_id) {
    print(address_id);
  }
}
