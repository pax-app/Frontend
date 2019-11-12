import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ChatAddressList extends StatefulWidget {
  final Function sendMessage;

  final Function navigateToCepModal;
  final int addressLength;
  final int chatId;
  final addresses;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ChatAddressList({
    this.addressLength,
    this.addresses,
    this.navigateToCepModal,
    this.chatId,
    this.sendMessage,
    this.scaffoldKey,
  });

  @override
  _ChatAddressListState createState() => _ChatAddressListState();
}

class _ChatAddressListState extends State<ChatAddressList> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: isLoading ? 1 : widget.addressLength,
      itemBuilder: (context, index) {
        bool isLast = index + 1 == widget.addressLength;

        return Column(
          children: <Widget>[
            Divider(height: 1, thickness: 1.2),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: CircularProgressIndicator(),
                  )
                : Material(
                    child: InkWell(
                      onTap: isLast
                          ? widget.navigateToCepModal
                          : () => _selectAddress(
                              widget.addresses[index].address_id, context),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        child: Text(
                          isLast
                              ? 'ADICIONAR ENDEREÇO'
                              : '${widget.addresses[index].street} Número ${widget.addresses[index].number}, ${widget.addresses[index].neighborhood} - CEP: ${widget.addresses[index].cep}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                isLast ? Theme.of(context).accentColor : null,
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
    setState(() {
      isLoading = true;
    });

    var response = await http.patch(
        'https://pax-chat.herokuapp.com/chat_address_update/${widget.chatId.toString()}/${addressId.toString()}');
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'updated') {
      widget.sendMessage(
        'Endereço enviado!',
        false,
        false,
      );
    } else {
      widget.scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(
            'Este endereço já foi enviado!',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
    Navigator.of(context).pop();
  }
}
