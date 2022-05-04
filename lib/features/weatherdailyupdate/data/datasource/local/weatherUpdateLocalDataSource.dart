import 'dart:convert';

import 'package:clean_code_architecture/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/sharedPref/pref.dart';
import '../../model/dailyWeatherUpdateModel.dart';

abstract class NumberLocalDataSource {
  Future<NumberModel> getLastNumberLocalDataSource();

  Future<void> cacheNumberLocalDataSource(
      {required NumberModel model});
}

class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  final SharedPref sharedPreferences;

  NumberLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheNumberLocalDataSource(
      {required NumberModel model}) {
    return sharedPreferences.setNumberModel(model);
  }

  @override
  Future<NumberModel> getLastNumberLocalDataSource() {
    var jsonString = sharedPreferences.getNumberModel();
    if (jsonString != null) {
      return Future.value(
          NumberModel.fromJson(json.decode(jsonString)));
    } else {
      throw CatchException();
    }
  }
}
