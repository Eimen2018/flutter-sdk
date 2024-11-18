typedef ProvideToken = void Function(String);

abstract class BiometricTokenCallback {
  void onTokenRequested(String customerUserHash, ProvideToken provideToken);

  void onTokenGenerated(String customerUserHash, String biometricToken);
}
