class KeywordModel {
  String? name;
  int? id;

  KeywordModel({this.name, this.id});

  KeywordModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}