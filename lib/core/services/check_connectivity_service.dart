import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivityService {
  CheckConnectivityService(this._connectivity);
  final Connectivity _connectivity;
  Future<bool> checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.last != ConnectivityResult.none;
  }
}
