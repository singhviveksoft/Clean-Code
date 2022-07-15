import 'package:clean_code_architecture/features/weatherdailyupdate/data/repoImpl/weatherupdateRepoImpl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/networkinfo/networkConnection.dart';
import 'core/sharedPref/pref.dart';
import 'features/weatherdailyupdate/data/datasource/local/weatherUpdateLocalDataSource.dart';
import 'features/weatherdailyupdate/data/datasource/remote/weatherUpdateRemoteDataSource.dart';
import 'features/weatherdailyupdate/domain/usescase/dailyweatherupdateUsescase.dart';
import 'features/weatherdailyupdate/presenatation/bloc/number_status_bloc.dart';
import 'features/weatherdailyupdate/presenatation/provider/numberProvider.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
 ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(
    value: NetworkConnectionImpl(),
  ),
  Provider.value(value: SharedPref()),
  Provider.value(value: http.Client()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<http.Client, NumberRemoteDataSourceImpl>(
      update: (context, client, _) {
    return NumberRemoteDataSourceImpl(client: client);
  }),
  ProxyProvider<SharedPref, NumberLocalDataSourceImpl>(
      update: (context, pref, _) {
    return NumberLocalDataSourceImpl(sharedPreferences: pref);
  }),
  ProxyProvider3<
      NumberLocalDataSourceImpl,
      NumberRemoteDataSourceImpl,
      NetworkConnectionImpl,
      NumberRepoImpl>(update: (context, local, remote, connection, _) {
    return NumberRepoImpl(
        localDataSource: local,
        connection: connection,
        remoteDataSource: remote);
  }),
  ProxyProvider<NumberRepoImpl, NumberUsesCase>(update: (context, repoImpl, _) {
    return NumberUsesCase(repo: repoImpl);
  }),
];

// List<SingleChildWidget> uiConsumableProviders = [
//   ChangeNotifierProvider<NumberProvider>(create: (context){
// return NumberProvider(usesCase: Provider.of<NumberUsesCase>(context,listen: false));
//   })

  /*ListenableProxyProvider<NumberUsesCase, NumberProvider>(
      update: (context, usesCase, _) {
    return NumberProvider(usesCase: usesCase);
  }),*/

List<SingleChildWidget> uiConsumableProviders = [
  BlocProvider<NumberStatusBloc>(create: (context){
return NumberStatusBloc(usesCase: Provider.of<NumberUsesCase>(context,listen: false));
  })

];
