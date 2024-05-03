class InfoTraject {
  late final String id;
  late final DateTime startingTime;
  late final DateTime arrivingTime;

  InfoTraject({
    required this.id,
    required this.startingTime,
    required this.arrivingTime,
  });

  InfoTraject.empty();

  factory InfoTraject.fromJson(Map<String, dynamic> json) {
    return InfoTraject(
      id: json['id'],
      startingTime: DateTime.parse(json['startingTime']),
      arrivingTime: DateTime.parse(json['arrivingTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startingTime': startingTime.toIso8601String(),
      'arrivingTime': arrivingTime.toIso8601String(),
    };
  }
}
