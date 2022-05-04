import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/weatherdailyupdate/data/model/dailyWeatherUpdateModel.dart';

class SharedPref {
  SharedPreferences? prefs;
  SharedPref(){
    initPref();
  }
  initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  setNumberModel(NumberModel model)async{

 await   prefs?.setString("key", json.encode(model.toJson()));
  }

  getNumberModel(){
    prefs?.getString('key');
  }
}
