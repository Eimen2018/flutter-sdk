class ProofOfAddressResult {
  String type;
  ProofOfAddressDocumentSide front;
  ProofOfAddressDocumentSide? back;

  ProofOfAddressResult({required this.type, required this.front, this.back});

  @override
  bool operator ==(Object other) {
    if (other is! ProofOfAddressResult) return false;
    if (other.type != type) return false;
    if (other.front != front) return false;
    if (other.back != back) return false;
    return true;
  }

  @override
  int get hashCode => type.hashCode + front.hashCode + back.hashCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['front'] = front;
    data['back'] = back;
    return data;
  }
}

class ProofOfAddressDocumentSide {
  String id;
  String? type;

  @override
  bool operator ==(Object other) {
    if (other is! ProofOfAddressDocumentSide) return false;
    if (other.id != id) return false;
    if (other.type != type) return false;
    return true;
  }

  @override
  int get hashCode => id.hashCode + type.hashCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }

  @override
  String toString() {
    return 'Side(id: $id, type: $type)';
  }

  ProofOfAddressDocumentSide({required this.id, this.type});
}
