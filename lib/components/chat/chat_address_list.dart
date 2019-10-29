import 'package:flutter/material.dart';

class ChatAddressList extends StatelessWidget {
  final int addressLength;
  final addresses;

  const ChatAddressList({this.addressLength, this.addresses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addressLength,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Divider(height: 1, thickness: 1.2),
            Material(
              child: InkWell(
                onTap: () => {print('foi')},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Text(
                    '${addresses[index]['street']} Número ${addresses[index]['number']}, ${addresses[index]['neighborhood']} - CEP: ${addresses[index]['cep']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
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
}
