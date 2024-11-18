import 'package:onfido_sdk/src/model/biometric_token_result.dart';

class BiometricTokenResultSerializer {
  static BiometricTokenGenerationResult deserialize(dynamic value) {
    return BiometricTokenGenerationResult(
      customerUserHash: value['customerUserHash'],
      biometricToken: value['biometricToken'],
    );
  }

  static BiometricTokenRequestResult deserializeRequest(dynamic value) {
    return BiometricTokenRequestResult(
      customerUserHash: value['customerUserHash'],
    );
  }
}
