import 'package:flutter/foundation.dart';

import 'country_code.dart';
import 'document_type.dart';

class DocumentCapture {
  final DocumentType? documentType;
  final CountryCode? countryCode;

  DocumentCapture({this.documentType, this.countryCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['documentType'] = documentType == null ? null : describeEnum(documentType!);
    data['countryCode'] = countryCode == null ? null : describeEnum(countryCode!);
    return data;
  }
}
