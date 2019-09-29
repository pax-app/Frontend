import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:flutter/material.dart';

class ProviderPanel extends StatelessWidget {
  final PageController _pageController;
  ProviderPanel(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUser(this._pageController),
      appBar: WhiteAppBar('Painel do Prestador'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Meus Serviços',
            style: Theme.of(context).textTheme.title,
          ),
          Container(
            // margin: EdgeInsets.only(top: 30),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text('AAOSDIJOIAJSDOIAJOSIDJAIPAJSODIJ')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('AAOSDIJOIAJSDOIAJOSIDJAIPAJSODIJ')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('AAOSDIJOIAJSDOIAJOSIDJAIPAJSODIJ')),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text('AAOSDIJOIAJSDOIAJOSIDJAIPAJSODIJ')),
              ],
            ),
          ),
          Divider(height: 70, color: Color.fromRGBO(0, 0, 0, .5)),
        ],
      ),
    );
  }
}

// Padding(
//         padding: const EdgeInsets.all(30),
//         child: Text(
//           'Meus Serviços',
//
//         ),
