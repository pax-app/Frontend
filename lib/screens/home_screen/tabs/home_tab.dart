import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.red,
              elevation: 0.0,
              flexibleSpace:  FlexibleSpaceBar(
                title: const Text("Home"),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}