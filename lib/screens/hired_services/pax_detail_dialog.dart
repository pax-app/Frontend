import 'package:Pax/components/base_dialog/base_dialog.dart';
import 'package:flutter/material.dart';

class PaxDetailDialog extends StatelessWidget {
  final String providerName;
  final String providerPhoto;
  var pax;

  PaxDetailDialog({this.pax, this.providerName, this.providerPhoto});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: 400,
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(providerPhoto),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      providerName,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      pax['date'],
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
