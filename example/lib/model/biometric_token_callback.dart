import 'package:fluttertoast/fluttertoast.dart';
import 'package:onfido_sdk/onfido_sdk.dart';

class ExampleBiometricTokenCallback implements BiometricTokenCallback {
  @override
  void onTokenGenerated(String customerUserHash, String biometricToken) {
    Fluttertoast.showToast(msg: "EBT Generated", toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3);
  }

  @override
  void onTokenRequested(String customerUserHash, ProvideToken provideToken) {
    provideToken("dummy-biometric-token");
    Fluttertoast.showToast(msg: "EBT Requested", toastLength: Toast.LENGTH_LONG, timeInSecForIosWeb: 3);
  }
}
