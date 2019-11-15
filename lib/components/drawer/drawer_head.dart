import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  final String img, name;
  final double qntStars;
  final PageController controller;

  DrawerHead(this.img, this.name, this.qntStars, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 56,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    controller.jumpToPage(0);
                  },
                  child: Image.asset(
                    'assets/logo/sidebar_logo.png',
                    height: 30,
                  ),
                )
              ],
            )),
        Material(
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: 130,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Theme.of(context).accentColor,
                          width: 3.0,
                        ),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/pax-messenger.appspot.com/o/chats%2Fscaled_13c1b1d5-c962-4e1e-b6df-26d03a9eaf906748638212161831975.jpg?alt=media&token=c52c2519-1b8a-4337-9258-b36db3e3d818',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                        // SizedBox(height: 4),
                        getUserStars(qntStars, context),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            'Ver seu Perfil',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget getUserStars(double n, BuildContext context) {
  List<Widget> list = new List<Widget>();
  int qntEl = n.toInt();
  for (int i = 1; i <= 5; i++) {
    if (i <= qntEl)
      list.add(IconTheme(
        child: Icon(Icons.star),
        data: IconThemeData(color: Theme.of(context).accentColor),
      ));
    else
      list.add(IconTheme(
        child: Icon(Icons.star_border),
        data: IconThemeData(color: Theme.of(context).accentColor),
      ));
  }

  if ((n - qntEl) > 0) {
    list[qntEl.round()] = IconTheme(
      child: Icon(Icons.star_half),
      data: IconThemeData(color: Theme.of(context).accentColor),
    );
  }
  return Row(children: list);
}
