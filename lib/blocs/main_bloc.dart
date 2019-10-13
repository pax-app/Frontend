import 'package:Pax/blocs/category_bloc.dart';
import 'package:Pax/blocs/general_category_bloc.dart';
import 'package:Pax/blocs/provider_bloc.dart';
import 'package:Pax/blocs/user_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MainBloc extends StatelessWidget {
  final Widget main;

  MainBloc(this.main);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: GeneralCategoryBloc(),
        child: BlocProvider(
          bloc: CategoryBloc(),
          child: BlocProvider(
            bloc: ProviderBloc(),
            child: BlocProvider(
              bloc: UserBloc(),
              child: main,
            ),
          ),
        ));
  }
}
