import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Map<String, String> imagesPaths = {
      'Assistência Técnica': 'assets/categories-img/gear.png',
      'Reformas ': 'assets/categories-img/paint.png',
      'Serviços Domésticos': 'assets/categories-img/clean.png',
      'Design e Tecnologia': 'assets/categories-img/code.png',
    };
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "Opões de Serviço",
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ],
        ),
      
      ],
    );
  }
}
