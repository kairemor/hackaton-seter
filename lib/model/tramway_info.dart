class TramwayInfo {
  late final String id;
  late final String info;

  TramwayInfo({
    required this.id,
    required this.info,
  });

  TramwayInfo.empty();

  factory TramwayInfo.fromJson(Map<String, dynamic> json) {
    return TramwayInfo(
      id: json['id'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'info': info,
    };
  }
}
