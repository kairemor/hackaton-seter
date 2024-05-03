class Subscription {
  late final String id;
  late final String type;
  late final DateTime startingDate;
  late final DateTime endingDate;

  Subscription({
    required this.id,
    required this.type,
    required this.startingDate,
    required this.endingDate,
  });

  Subscription.empty();

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      type: json['type'],
      startingDate: DateTime.parse(json['startingDate']),
      endingDate: DateTime.parse(json['endingDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'startingDate': startingDate.toIso8601String(),
      'endingDate': endingDate.toIso8601String(),
    };
  }
}
