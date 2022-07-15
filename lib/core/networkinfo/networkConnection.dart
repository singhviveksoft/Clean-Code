import 'package:connectivity/connectivity.dart';

abstract class NetworkConnection {

  Future<bool> get isConnection;
  Future<bool> checkInternet();

}

class NetworkConnectionImpl implements NetworkConnection {


  NetworkConnectionImpl();

  @override
  Future<bool> get isConnection =>  checkInternet();

  @override
  Future<bool> checkInternet() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
    return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


}
