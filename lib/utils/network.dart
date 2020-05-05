import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/strings.dart';

enum ConnectivityStatus {
  WiFi,
  Cellular,
  Offline
}

class NetworkConnection
{

  //Internet Connectivity
  bool checkConnection;
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup(googleLink);
      if (result.isNotEmpty && result[i_0].rawAddress.isNotEmpty) {
        checkConnection = true;
      }
    } on SocketException catch (_) {
      checkConnection = false;
    }
    return checkConnection;
  }

}

class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();
  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }
  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}