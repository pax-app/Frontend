import 'dart:async';
import 'package:Pax/models/GeneralCategory.dart';
import 'package:Pax/models/category.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class GeneralCategoryBloc implements BlocBase {
  List<GeneralCategory> generalCategories = List<GeneralCategory>();
  List<GeneralCategory> apiGeneralCategories = List<GeneralCategory>();

  final _outGeneralCategoryController =
      BehaviorSubject<List<GeneralCategory>>();
  Stream get outGeneralCategories => _outGeneralCategoryController.stream;

  GeneralCategoryBloc() {
    List<Category> c = List<Category>();
    c.add(Category(id: 7, name: "Arrumar algo"));
    c.add(Category(id: 8, name: "Algo"));
    c.add(Category(id: 10, name: "Trabalho"));
    c.add(Category(id: 78, name: "Lavar casa"));
    c.add(Category(id: 99, name: "Deu bom"));
    apiGeneralCategories.add(
      GeneralCategory(id: 1, name: "Assistência Técnica", categories: c),
    );
    apiGeneralCategories.add(
      GeneralCategory(id: 2, name: "Reformas", categories: c),
    );
    apiGeneralCategories.add(
      GeneralCategory(id: 3, name: "Serviços Domésticos", categories: c),
    );
    apiGeneralCategories.add(
      GeneralCategory(id: 4, name: "Design e Tecnologia", categories: c),
    );

    _outGeneralCategoryController.sink.add(apiGeneralCategories);
  }

  @override
  void dispose() {
    _outGeneralCategoryController.close();
  }
}
