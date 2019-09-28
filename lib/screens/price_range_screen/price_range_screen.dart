import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class PriceRangeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faixa de Preço',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RangeSliderSample(),
    );
  }
}

class RangeSliderSample extends StatefulWidget {
  @override
  _RangeSliderSampleState createState() => _RangeSliderSampleState();
}

class _RangeSliderSampleState extends State<RangeSliderSample> {
  // List of RangeSliders to use, together with their parameters

  double _lowerValue = 20.0;
  double _upperValue = 80.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(title: Text('Faixa de Preço')),
        body: Container(
            padding: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
            child: Column(
                children: <Widget>[]
                  ..add(
                    frs.RangeSlider(
                      min: 0.0,
                      max: 100.0,
                      lowerValue: _lowerValue,
                      upperValue: _upperValue,
                      divisions: 20,
                      showValueIndicator: true,
                      valueIndicatorFormatter: (int index, double value) {
                        String twoDecimals = value.toStringAsFixed(2);
                        return 'R\$ $twoDecimals';
                      },
                      onChanged: (double newLowerValue, double newUpperValue) {
                        setState(() {
                          _lowerValue = newLowerValue;
                          _upperValue = newUpperValue;
                        });
                      },
                    ),
                  )
                  ..add(Text(
                      'Valor Mínimo: R\$${_lowerValue.toStringAsFixed(2)}'))
                  ..add(Text(
                      'Valor Máximo: R\$${_upperValue.toStringAsFixed(2)}')))),
      ),
    );
  }
}
