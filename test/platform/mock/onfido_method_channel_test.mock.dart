part of '../onfido_method_channel_test.dart';

const startMockRequestBody = {
  'sdkToken': 'sdkToken',
  'flowSteps': {
    'welcome': false,
    'proofOfAddress': true,
    'documentCapture': {'documentType': 'nationalIdentityCard', 'countryCode': 'UGA'},
    'faceCapture': {
      'type': 'video',
      'withIntroVideo': null,
      'withConfirmationVideoPreview': null,
      'withManualLivenessCapture': null
    },
  },
  'iosLocalizationFileName': 'file',
  'shouldUseMediaCallback': false,
  'iosAppearance': {
    'primaryColor': '#0012c4b4',
    'primaryTitleColor': null,
    'secondaryTitleColor': '#0a141e0a',
    'primaryBackgroundPressedColor': null,
    'secondaryBackgroundPressedColor': null,
    'buttonCornerRadius': null,
    'fontRegular': 'avenir',
    'fontBold': 'avenir-heavy',
    'backgroundColor': {'dark': '#1e140a0a', 'light': '#0a141e0a'}
  },
  'enterpriseFeatures': {'hideOnfidoLogo': true, 'cobrandingText': 'text', 'disableMobileSDKAnalytics': false},
  'nfcOption': "OPTIONAL",
  "onfidoTheme": "LIGHT"
};

const startStudioMockRequestBody = {
  'sdkToken': 'sdkToken',
  'workflowRunId': 'workflowRunId',
  'iosLocalizationFileName': 'iosFileName',
  'shouldUseMediaCallback': false,
  'shouldUseBiometricTokenCallback': false,
  'iosAppearance': {
    'primaryColor': '#0012c4b4',
    'primaryTitleColor': null,
    'secondaryTitleColor': '#0a141e0a',
    'primaryBackgroundPressedColor': null,
    'secondaryBackgroundPressedColor': null,
    'buttonCornerRadius': null,
    'fontRegular': 'avenir',
    'fontBold': 'avenir-heavy',
    'backgroundColor': {'dark': '#1e140a0a', 'light': '#0a141e0a'}
  },
  "enterpriseFeatures": null,
  "onfidoTheme": null
};

const startMockResponse = [
  {
    'document': {
      'front': {'id': '123'},
      'typeSelected': 'typeSelected',
      'countrySelected': 'countrySelected',
      'nfcMediaId': 'nfcMediaUuid'
    },
    'face': {'id': '123', 'variant': 1},
    'proofOfAddress': {
      'type': 'type',
      'front': {'id': '123', 'type': 'type'}
    }
  }
];

final mockedResultObject = OnfidoResult(
  document: DocumentResult(
      front: DocumentSideResult(id: "123"),
      typeSelected: "typeSelected",
      countrySelected: "countrySelected",
      nfcMediaId: "nfcMediaUuid"),
  face: FaceResult(
    id: "123",
    variant: FaceCaptureType.video,
  ),
  proofOfAddress:
      ProofOfAddressResult(type: "type", front: ProofOfAddressDocumentSide(id: "123", type: "type"), back: null),
);

final mockedMediaResultObject = OnfidoMediaResult(
    resultType: OnfidoMediaResultType.documentResult,
    fileData: OnfidoMediaFile(fileData: "abcd" as Uint8List, fileType: "jpeg", fileName: "abcd.jpeg"),
    documentMetadata: OnfidoDocumentMetadata(side: "front", type: "passport", issuingCountry: "USA"));
