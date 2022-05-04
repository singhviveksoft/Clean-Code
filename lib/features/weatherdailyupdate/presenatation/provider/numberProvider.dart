import 'package:clean_code_architecture/core/networkinfo/networkConnection.dart';
import 'package:clean_code_architecture/features/weatherdailyupdate/data/datasource/local/weatherUpdateLocalDataSource.dart';
import 'package:clean_code_architecture/features/weatherdailyupdate/data/datasource/remote/weatherUpdateRemoteDataSource.dart';
import 'package:clean_code_architecture/features/weatherdailyupdate/data/repoImpl/weatherupdateRepoImpl.dart';
import 'package:clean_code_architecture/features/weatherdailyupdate/domain/entities/dailyweatherupdate.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/status.dart';
import '../../domain/usescase/dailyweatherupdateUsescase.dart';

class NumberProvider with ChangeNotifier {
  NumberEntities? data;
  UIState uiState;
  NumberUsesCase usesCase;

  NumberProvider({required this.usesCase}) : uiState = UIState.loading;

  void getNumber() async {

    final result = await usesCase
        .execute();
    result.fold((failure) {
      uiState = UIState.error;
      notifyListeners();
    }, (onData) {
      data = onData;
      uiState = UIState.sucess;
      notifyListeners();
    });
  }
}
