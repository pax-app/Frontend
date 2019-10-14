import 'package:Pax/models/GeneralCategory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<GeneralCategory>> getGeneralCategories() async {
  final String url = 'http://10.0.2.2:5002/category/general';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => GeneralCategory.fromJson(data));
}
