import 'package:onfido_sdk/onfido_sdk.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnfidoPlatform with MockPlatformInterfaceMixin implements OnfidoPlatform {
  MockOnfidoPlatform({this.startResult, this.mediaResult});

  final List<OnfidoResult>? startResult;
  final OnfidoMediaResult? mediaResult;
  var startCount = 0;
  late String startSdkToken;
  late FlowSteps startFlowSteps;
  late String? startIosLocalizationFileName;
  late EnterpriseFeatures? startEnterpriseFeatures;
  late NFCOptions? withNfcOption;
  late OnfidoMediaCallback? customMediaCallback;
  late BiometricTokenCallback? customBiometricTokenCallback;
  late OnfidoTheme? theme;

  @override
  Future<List<OnfidoResult>> start(
      {required String sdkToken,
      required FlowSteps flowSteps,
      String? iosLocalizationFileName,
      IOSAppearance? iosAppearance,
      EnterpriseFeatures? enterpriseFeatures,
      NFCOptions? nfcOption,
      OnfidoMediaCallback? mediaCallback,
      OnfidoTheme? onfidoTheme}) {
    startCount++;
    startSdkToken = sdkToken;
    startFlowSteps = flowSteps;
    startIosLocalizationFileName = iosLocalizationFileName;
    startEnterpriseFeatures = enterpriseFeatures;
    withNfcOption = nfcOption;
    customMediaCallback = mediaCallback;
    theme = onfidoTheme;
    return Future.value(startResult!);
  }

  var startStudioCount = 0;
  late String startStudioSdkToken;
  late String startStudioWorkflowRunId;
  late EnterpriseFeatures? startStudioEnterpriseFeatures;

  @override
  Future<void> startWorkflow(
      {required String sdkToken,
      required String workflowRunId,
      String? iosLocalizationFileName,
      IOSAppearance? iosAppearance,
      OnfidoMediaCallback? mediaCallback,
      BiometricTokenCallback? biometricTokenCallback,
      EnterpriseFeatures? enterpriseFeatures,
      OnfidoTheme? onfidoTheme}) {
    startStudioCount++;
    startStudioSdkToken = sdkToken;
    startStudioWorkflowRunId = workflowRunId;
    startStudioEnterpriseFeatures = enterpriseFeatures;
    customMediaCallback = mediaCallback;
    customBiometricTokenCallback = biometricTokenCallback;
    theme = onfidoTheme;
    return Future.value();
  }
}
