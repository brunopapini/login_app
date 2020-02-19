class Usuario {
  String key;

  Usuario({this.key});

  Usuario.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    return data;
  }

  String toString() {
    return "Usuario(key:$key)";
  }
}