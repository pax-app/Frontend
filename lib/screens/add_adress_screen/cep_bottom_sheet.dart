import 'package:Pax/components/base_bottom_sheet/BaseBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:Pax/components/button%20/button.dart';

class CepBottomSheet extends StatefulWidget {
  double lowerValue;
  double upperValue;
  final Function updatePriceRange;

  CepBottomSheet({
    this.lowerValue,
    this.upperValue,
    this.updatePriceRange,
  });

  @override
  _CepBottomSheetState createState() => _CepBottomSheetState();
}

class _CepBottomSheetState extends State<CepBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      sheetBody: Column(children: <Widget>[
        Text("Fabi linda", style: Theme.of(context).textTheme.title),
        SizedBox(height: 10),
        Text(
          "Lindíssima mesmo",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Button(
          buttonText: 'PRONTO',
          type: 'default',
          tapHandler: () => Navigator.pop(context),
          isSmall: false,
        )
      ]),
    );
  }
}
