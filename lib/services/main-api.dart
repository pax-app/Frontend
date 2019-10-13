import 'package:Pax/services/category-api.dart';
import 'package:Pax/services/provider-api.dart';
import 'package:Pax/services/user-api.dart';

class MainApi {
  static String url = "";
  final ProviderApi providerApi = ProviderApi(url);
  final UserApi userApi = UserApi(url);
  final CategoryApi categoryApi = CategoryApi(url);
}
