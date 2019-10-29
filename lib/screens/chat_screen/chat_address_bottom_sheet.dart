import 'dart:convert';
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
            child: isLoading == false
                ? ListView.builder(
                    itemCount: _addressLength,
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
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
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
