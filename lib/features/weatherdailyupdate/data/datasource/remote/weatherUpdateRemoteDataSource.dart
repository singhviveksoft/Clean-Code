import 'dart:convert';

import 'package:clean_code_architecture/core/error/exception.dart';

import '../../model/dailyWeatherUpdateModel.dart';
import 'package:http/http.dart' as http;

abstract class NumberRemoteDataSource {
  Future<NumberModel> getNumberRemoteDataSource();
}

class NumberRemoteDataSourceImpl implements NumberRemoteDataSource {
  final http.Client client;

  NumberRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberModel> getNumberRemoteDataSource() async {
    try {
      var response = await client.get(Uri.parse('http://numberapi.com/42'),
          headers: {'Content-Type': 'application/json'});
      print(response.toString());
      if (response.statusCode == 200) {
        return NumberModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
