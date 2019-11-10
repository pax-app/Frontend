import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ChatAddressList extends StatelessWidget {
  final Function sendMessage;

  final Function navigateToCepModal;
  final int addressLength;
  final int chatId;
  final addresses;

  ChatAddressList({
    this.addressLength,
    this.addresses,
    this.navigateToCepModal,
    this.chatId,
    this.sendMessage,
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
                onTap: isLast
                    ? navigateToCepModal
                    : () =>
                        _selectAddress(addresses[index].address_id, context),
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  child: Text(
                    isLast
                        ? 'ADICIONAR ENDEREÇO'
                        : '${addresses[index].street} Número ${addresses[index].number}, ${addresses[index].neighborhood} - CEP: ${addresses[index].cep}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isLast ? Theme.of(context).accentColor : null,
                      height: 1.5,
                      fontWeight: isLast ? FontWeight.w500 : null,
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

  void _selectAddress(int addressId, BuildContext context) async {
    print(chatId);
    print(addressId);
    var response = await http.patch(
        'http://192.168.0.42:3001/chat_address_update/${chatId.toString()}/${addressId.toString()}');
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'updated') {
      sendMessage(
        'Endereço enviado para o prestador de serviço',
        false,
        false,
      );
    }

    print(jsonData['status']);
  }
}
