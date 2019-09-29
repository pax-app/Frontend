import 'dart:async';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class GeneralCategoryBloc implements BlocBase {
  List<GeneralCategory> generalCategories = List<GeneralCategory>();
  List<GeneralCategory> apiGeneralCategories = List<GeneralCategory>();

  final _generalCategoryController = StreamController<List<GeneralCategory>>();

  Stream get outGeneralCategories => _generalCategoryController.stream;

  GeneralCategoryBloc() {
    apiGeneralCategories
        .add(GeneralCategory(id: 1, name: "Assistência Técinica"));
    apiGeneralCategories.add(GeneralCategory(id: 2, name: "Reformas"));
    apiGeneralCategories
        .add(GeneralCategory(id: 3, name: "Serviços Domésticos"));
    apiGeneralCategories
        .add(GeneralCategory(id: 4, name: "Design e Tecnologia"));
  }

  @override
  void dispose() {
    _generalCategoryController.close();
  }
}
