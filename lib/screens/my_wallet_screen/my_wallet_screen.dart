import 'package:Pax/components/zebra_tile/zebra_tile.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green, Colors.teal],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 200, 10, .3),
                offset: Offset(0, 3),
                blurRadius: 4.2,
              )
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 3),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 12, bottom: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Este Mês',
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Text(
                'R\$ 900,00',
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        ZebraTile(
          paxName: 'Colocar SSD',
          username: 'Fabiana',
          date: '20/11/2019',
          money: 30,
          darken: false,
        ),
        ZebraTile(
          paxName: 'Colocar SSD',
          username: 'Fabiana',
          date: '20/11/2019',
          money: 30,
          darken: true,
        ),
        ZebraTile(
          paxName: 'Colocar SSD',
          username: 'Fabiana',
          date: '20/11/2019',
          money: 30,
          darken: false,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
