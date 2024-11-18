class Workflow {
  String? id;
  String? studioToken;

  Workflow({this.id, this.studioToken});

  Workflow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studioToken = json['sdk_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
