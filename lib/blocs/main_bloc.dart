import 'package:Pax/blocs/category_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MainBloc extends StatelessWidget {
  final Widget main;

  MainBloc(this.main);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CategoryBloc(),
      child: main,
    );
  }
}
