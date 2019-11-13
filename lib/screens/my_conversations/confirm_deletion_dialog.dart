import 'package:Pax/components/base_dialog/base_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmDeletionDialog extends StatelessWidget {
  final Function deleteAllSelectedChats;

  const ConfirmDeletionDialog({
    @required this.deleteAllSelectedChats,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: 210,
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Tem certeza que quer deletar?',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 20),
            Text('Depois disso não poderá acessar mais estas conversas'),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Não'),
                  textColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () {
                    deleteAllSelectedChats();
                    Navigator.of(context).pop();
                  },
                  textColor: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete_forever),
                      Text('Sim'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
