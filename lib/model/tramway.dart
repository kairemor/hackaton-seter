class Tramway {
  late final String id;
  late final String name;
  late final String code;

  Tramway({
    required this.id,
    required this.name,
    required this.code,
  });

  Tramway.empty();

  factory Tramway.fromJson(Map<String, dynamic> json) {
    return Tramway(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }
}
