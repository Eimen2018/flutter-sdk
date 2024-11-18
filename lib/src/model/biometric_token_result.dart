class BiometricTokenGenerationResult {
  const BiometricTokenGenerationResult({
    required this.customerUserHash,
    required this.biometricToken,
  });

  final String customerUserHash;
  final String biometricToken;
}

class BiometricTokenRequestResult {
  const BiometricTokenRequestResult({
    required this.customerUserHash,
  });

  final String customerUserHash;
}
