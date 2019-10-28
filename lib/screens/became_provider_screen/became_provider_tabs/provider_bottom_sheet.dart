import 'package:Pax/components/base_bottom_sheet/BaseBottomSheet.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:Pax/components/button%20/button.dart';

class ProviderBottomSheet extends StatefulWidget {
  double lowerValue;
  double upperValue;
  final Function updatePriceRange;

  ProviderBottomSheet({
    this.lowerValue,
    this.upperValue,
    this.updatePriceRange,
  });

  @override
  _ProviderBottomSheetState createState() => _ProviderBottomSheetState();
}

class _ProviderBottomSheetState extends State<ProviderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      sheetBody: Column(children: <Widget>[
        Text("Faixa de preço para seus serviços",
            style: Theme.of(context).textTheme.title),
        SizedBox(height: 10),
        Text(
          "Esse valor não precisa ser regra, você ainda pode negociar com seu cliente",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Min: R\$${widget.lowerValue}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    'Max: R\$${widget.upperValue}',
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
            ]..add(
                frs.RangeSlider(
                  min: 0.0,
                  max: 200.0,
                  lowerValue: widget.lowerValue,
                  upperValue: widget.upperValue,
                  divisions: 10,
                  showValueIndicator: true,
                  valueIndicatorFormatter: (int index, double value) {
                    String twoDecimals = value.toStringAsFixed(2);
                    return 'R\$ $twoDecimals';
                  },
                  onChanged: (double newLowerValue, double newUpperValue) {
                    widget.updatePriceRange(newLowerValue, newUpperValue);
                    setState(() {
                      widget.lowerValue = newLowerValue;
                      widget.upperValue = newUpperValue;
                    });
                  },
                ),
              ),
          ),
        ),
        SizedBox(height: 20),
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
