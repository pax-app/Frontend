import 'package:Pax/components/zebra_tile/zebra_tile.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 118,
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
                'R\$ 1040,00',
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
          paxName: 'Mudar de SO',
          username: 'Youssef Muhamad',
          date: '20/11/2019',
          money: 50,
          darken: true,
        ),
        ZebraTile(
          paxName: 'Pintar Unhas',
          username: 'Fabiana Ribas',
          date: '20/11/2019',
          money: 100,
          darken: false,
        ),
        ZebraTile(
          paxName: 'Cortar o Cabelo',
          username: 'Gabriel Albino',
          date: '20/11/2019',
          money: 35,
          darken: true,
        ),
        ZebraTile(
          paxName: 'Instalar SSD',
          username: 'Rogério Júnior',
          date: '20/11/2019',
          money: 40,
          darken: false,
        ),
        ZebraTile(
          paxName: 'Arrumar o Violão',
          username: 'Fepas',
          date: '20/11/2019',
          money: 60,
          darken: true,
        ),
        ZebraTile(
          paxName: 'Fazer o TCC',
          username: 'Matheus Figueiredo',
          date: '20/11/2019',
          money: 350,
          darken: false,
        ),
        ZebraTile(
          paxName: 'Arrumar Placa de Rede',
          username: 'Marcos',
          date: '20/11/2019',
          money: 70,
          darken: true,
        ),
        ZebraTile(
          paxName: 'Montar Bateria',
          username: 'Lucas Dutra',
          date: '20/11/2019',
          money: 35,
          darken: false,
        ),
        ZebraTile(
          paxName: 'Fazer Tatuagem',
          username: 'Ésio Freitas',
          date: '20/11/2019',
          money: 300,
          darken: true,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
