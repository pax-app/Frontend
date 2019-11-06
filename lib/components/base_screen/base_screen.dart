import 'package:Pax/components/app_bar/white_appbar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String pageTitle, appBarTitle;
  final Widget body, drawer;
  final bool padding;
  final List<Widget> actions;

  BaseScreen(
    this.appBarTitle,
    this.pageTitle,
    this.body,
    this.drawer, {
    this.padding = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WhiteAppBar(appBarTitle, context, actions: actions),
      drawer: drawer,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            pageTitle == ""
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 30, left: 20, right: 10),
                    child: Text(
                      pageTitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.title.fontFamily,
                        fontSize: Theme.of(context).textTheme.title.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.title.fontWeight,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    ),
                  ),
            Padding(
              padding: padding
                  ? EdgeInsets.symmetric(horizontal: 20)
                  : EdgeInsets.all(0),
              child: Container(
                child: body,
              ),
            )
          ],
        ),
      ),
    );
  }
}
