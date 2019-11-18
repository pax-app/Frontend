import 'package:Pax/services/loggedUser.dart';
import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  final nameRegex = RegExp(r'(^[\wÀ-Ÿ]+).* ([\wÀ-Ÿ]+$)');
  final String img, name;
  final double qntStars;
  final PageController controller;
  final loggedUser = LoggedUser();

  DrawerHead(this.img, this.name, this.qntStars, this.controller);

  Color colorOfSidebarItem(BuildContext context) {
    return controller.page.round() == 1
        ? Theme.of(context).accentColor
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    print(loggedUser.name);
    return Column(
      children: <Widget>[
        Container(
          height: 56,
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo/sidebar_logo.png',
                height: 30,
              ),
            ],
          ),
        ),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              controller.jumpToPage(1);
            },
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
                      ),
                      child: ClipOval(
                        child: loggedUser.photo != null &&
                                loggedUser.photo.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: 'assets/gifs/spinner.gif',
                                image: loggedUser.photo,
                              )
                            : Image.asset('assets/user-img/default.png'),
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
                            "${nameRegex.firstMatch(loggedUser.name.trim()).group(1)} ${nameRegex.firstMatch(LoggedUser().name.trim()).group(2)}",
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                        // SizedBox(height: 4),
                        getUserStars(qntStars, context),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            'Ver meu Perfil',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: colorOfSidebarItem(context)),
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
  int qntEl = n != null ? n.toInt() : 0;
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
