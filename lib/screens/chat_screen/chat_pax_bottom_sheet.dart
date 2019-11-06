import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class ChatPaxBottomSheet extends StatefulWidget {
  @override
  _ChatPaxBottomSheetState createState() => _ChatPaxBottomSheetState();
}

class _ChatPaxBottomSheetState extends State<ChatPaxBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      modalHeight: MediaQuery.of(context).size.height - 100,
      sheetBody: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
            ),
            child: Text(
              'Preencha o que falta para enviar o seu PAX',
              style: Theme.of(context).textTheme.title.copyWith(height: 1.3),
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
          TextInput(
            'Descrição',
            'Descreva o que irá fazer...',
            false,
            null,
            TextInputType.text,
            1,
            controller: _descriptionController,
          ),
          TextInput(
            'Endereço',
            '',
            false,
            null,
            TextInputType.text,
            2,
            controller: _nameController,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 150,
                child: TextInput(
                  'Preço',
                  'Total a pagar',
                  true,
                  null,
                  TextInputType.text,
                  1,
                  controller: _priceController,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Button(
            buttonText: 'Enviar',
            tapHandler: () {},
          )
        ],
      ),
    );
  }
}
