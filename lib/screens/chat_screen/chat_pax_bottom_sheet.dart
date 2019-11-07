import 'package:Pax/components/base_bottom_sheet/base_bottom_sheet.dart';
import 'package:Pax/components/button%20/button.dart';
import 'package:Pax/components/disabled_outline_input/disabled_outline_input.dart';
import 'package:Pax/components/text_input/text_input.dart';
import 'package:flutter/material.dart';

class ChatPaxBottomSheet extends StatefulWidget {
  @override
  _ChatPaxBottomSheetState createState() => _ChatPaxBottomSheetState();
}

class _ChatPaxBottomSheetState extends State<ChatPaxBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController(
      text: 'Endereço do usuário bla bla bla 123 123 123 123 3331313 ');
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets.bottom);
    return BaseBottomSheet(
      // o inset do keyboard funfa só uma vez
      modalHeight: _nameController.text.isNotEmpty &&
              _descriptionController.text.isNotEmpty &&
              _priceController.text.isEmpty
          ? MediaQuery.of(context).viewInsets.bottom + 540
          : 540,
      sheetBody: SingleChildScrollView(
        child: Column(
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
                textController: _addressController,
              ),
            ),
            SizedBox(height: 7),
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
            SizedBox(height: 25),
            Button(
              buttonText: 'Enviar',
              tapHandler: _nameController.text.isNotEmpty &&
                      _descriptionController.text.isNotEmpty &&
                      _addressController.text.isNotEmpty &&
                      _priceController.text.isNotEmpty
                  ? () {}
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
