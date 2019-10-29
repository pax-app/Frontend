import 'dart:convert';
import 'package:Pax/components/chat/chat_address_list.dart';
import 'package:Pax/screens/chat_screen/chat_cep_bottom_sheet.dart';
import 'package:http/http.dart' as http;

import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChatAddressBottomSheet extends StatefulWidget {
  final user_id;

  ChatAddressBottomSheet({@required this.user_id});

  @override
  _ChatAddressBottomSheetState createState() => _ChatAddressBottomSheetState();
}

class _ChatAddressBottomSheetState extends State<ChatAddressBottomSheet> {
  bool isLoading = true;
  bool isInCepModal = false;
  var addresses;

  @override
  void initState() {
    super.initState();
    _getUserAddresses();
  }

  @override
  Widget build(BuildContext context) {
    int _addressLength = isLoading == true ? 1 : addresses.length;
    double _currentSheetHeight = 80 + 100 * _addressLength.toDouble();

    return BaseBottomSheet(
      modalHeight: isInCepModal
          ? 290 + MediaQuery.of(context).viewInsets.bottom
          : _currentSheetHeight > 380 ? 380 : _currentSheetHeight,
      sheetBody: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
            ),
            child: Text(
              isInCepModal
                  ? 'Vamos buscar seu endereço pelo CEP'
                  : 'Escolha o endereço para o prestador realizar o serviço',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: isLoading == true
                ? Center(child: CircularProgressIndicator())
                : isInCepModal == true
                    ? ChatCepBottomSheet()
                    : ChatAddressList(
                        addressLength: _addressLength,
                        addresses: addresses,
                        navigateToCepModal: _navigateToCepModal,
                      ),
          ),
        ],
      ),
    );
  }

  void _navigateToCepModal() {
    setState(() {
      isInCepModal = true;
    });
  }

  void _getUserAddresses() async {
    var params = {'user_id': '${widget.user_id.toString()}'};

    Uri uri = Uri.parse("https://pax-user.herokuapp.com/get_addresses");
    final newURI = uri.replace(queryParameters: params);

    var response = await http.get(newURI);
    var jsonData = json.decode(response.body);

    setState(() {
      addresses = jsonData;
      isLoading = false;
    });
  }
}
