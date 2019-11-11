import 'package:Pax/components/bottom_warning/bottom_warning.dart';
import 'package:Pax/components/disabled_outline_input/disabled_outline_input.dart';
import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:http/http.dart' as http;
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class ChatPaxBottomSheet extends StatefulWidget {
  final Function sendPaxFirebase;
  final Function isLastPaxPending;

  final int chatId;
  final int providerId;
  final int userId;

  ChatPaxBottomSheet({
    this.chatId,
    this.providerId,
    this.userId,
    this.sendPaxFirebase,
    this.isLastPaxPending,
  });

  @override
  _ChatPaxBottomSheetState createState() => _ChatPaxBottomSheetState();
}

class _ChatPaxBottomSheetState extends State<ChatPaxBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _priceController = TextEditingController();

  DateTime objectDate = DateTime(2019, 01, 01);
  String formattedDate;
  final formatDate = DateFormat("dd MMMM yyyy", "pt-BR");

  bool isPaxLoading = false;
  bool isFormReady = false;
  bool isLastPaxPending = false;
  bool isAddressMissing = false;

  @override
  void initState() {
    super.initState();
    setPax();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      curveAnimation: Curves.linear,
      duration: Duration(milliseconds: 200),
      modalHeight:
          isFormReady ? MediaQuery.of(context).viewInsets.bottom + 580 : 150,
      sheetBody: isFormReady && !isLastPaxPending && !isAddressMissing
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                    ),
                    child: Text(
                      'Preencha o que falta para enviar o seu PAX',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextInput(
                    'Nome',
                    'Nome do serviço a ser prestado...',
                    false,
                    null,
                    TextInputType.text,
                    1,
                    controller: _nameController,
                  ),
                  SizedBox(height: 3),
                  TextInput(
                    'Descrição',
                    'Descreva o que irá fazer...',
                    false,
                    null,
                    TextInputType.text,
                    1,
                    controller: _descriptionController,
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.2),
                    child: DisabledOutlineInput(
                      labelText: 'Endereço',
                      lines: _addressController.text.length > 90
                          ? 4
                          : _addressController.text.length > 70 ? 3 : 2,
                      textController: _addressController,
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: TextInput(
                          'Preço',
                          'Total a pagar',
                          true,
                          null,
                          TextInputType.number,
                          1,
                          controller: _priceController,
                        ),
                      ),
                      Container(
                        height: 59,
                        width: MediaQuery.of(context).size.width / 2.5,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          splashColor: secondaryColorDimmed,
                          onPressed: _presentDatePicker,
                          child: Text(
                            objectDate == DateTime(2019, 01, 01)
                                ? 'ESCOLHA A DATA'
                                : formatDate.format(objectDate),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Button(
                    isLoading: isPaxLoading,
                    buttonText: 'Enviar',
                    tapHandler: _isFormFilled() ? _createPax : null,
                  )
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: isLastPaxPending == true && !isAddressMissing
                    ? BottomWarning(
                        text: 'O usuário ainda não se decidiu.',
                        icon: Icons.error_outline,
                      )
                    : isAddressMissing
                        ? BottomWarning(
                            text: 'O usuário não enviou o endereço',
                            icon: Icons.location_off,
                          )
                        : CircularProgressIndicator(),
              ),
            ),
    );
  }

  void setPax() async {
    bool isPaxPending = await widget.isLastPaxPending();

    if (isPaxPending == true) {
      setState(() {
        isLastPaxPending = true;
      });
      return;
    }

    var address_id;
    var pax = await _getPax();

    if (pax['exists'] == 'true') {
      address_id = pax['pax']['address_id'];

      _updateDateAndDatePicker(pax['pax']['date']);
      _updatePaxInputs(pax['pax']);
    } else
      address_id = await _getAddressIdFromChat();

    if (isAddressMissing == false) {
      var address = await _getUserAddress(address_id);
      _updateAddressInput(address);
      setState(() {
        isFormReady = true;
      });
    }
  }

  void _createPax() async {
    setState(() {
      isPaxLoading = true;
    });

    var pax = {
      "date": formattedDate,
      "description": _descriptionController.text,
      "name": _nameController.text,
      "price": double.parse(_priceController.text),
      "user_id": 1,
      "provider_id": 1,
      "chat_id": widget.chatId,
      "address_id": 8,
    };
    var body = json.encode(pax);
    var res = await http.post(
      'https://pax-pax.herokuapp.com/pax/upCreate',
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    setState(() {
      isPaxLoading = false;
    });

    widget.sendPaxFirebase(_nameController.text, false, true);
    Navigator.of(context).pop();
  }

  Future<dynamic> _getPax() async {
    var res = await http
        .get('https://pax-pax.herokuapp.com/pax/consult_pax/${widget.chatId}');
    var paxJson = json.decode(res.body);
    return paxJson;
  }

  Future<dynamic> _getAddressIdFromChat() async {
    var res =
        await http.get('https://pax-chat.herokuapp.com/chat/${widget.chatId}');
    var chatJson = json.decode(res.body);

    var address_id = chatJson['user_address'];
    if (address_id == null) {
      setState(() {
        isAddressMissing = true;
      });
    }
    return address_id;
  }

  Future<dynamic> _getUserAddress(int address_id) async {
    var res = await http
        .get('https://pax-user.herokuapp.com/get_address/${address_id}');
    var addressJson = json.decode(res.body);
    return addressJson;
  }

  void _updatePaxInputs(var pax) {
    _nameController.text = pax['name'];
    _descriptionController.text = pax['description'];
    _priceController.text = pax['price'].toString();
  }

  void _updateAddressInput(var address) {
    _addressController.text =
        '${address['street']} Número ${address['number'].toString()}, ${address['complement'] != null ? address['complement'] + ', ' : ''} ${address['neighborhood']} - CEP: ${address['cep'].toString()} ${address['reference_point'] != null ? '\nPonto de referência: ' + address['reference_point'] : ''}';
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: formattedDate == null ? DateTime.now() : objectDate,
      firstDate: DateTime(2018, DateTime.now().month),
      lastDate: DateTime(2025),
    ).then((date) {
      if (date == null) return;
      String format = DateFormat("yyyy-MM-dd").format(date);
      setState(() {
        formattedDate = format;
        objectDate = date;
      });
    });
  }

  void _updateDateAndDatePicker(var date) {
    DateTime paxObjectDate = DateFormat('EEE, dd MMM yyyy').parse(date);

    setState(() {
      objectDate = paxObjectDate;
      formattedDate = DateFormat("yyyy-MM-dd").format(paxObjectDate);
    });
  }

  bool _isFormFilled() {
    return _nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _priceController.text.isNotEmpty;
  }
}
