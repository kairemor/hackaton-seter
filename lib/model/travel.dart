class Travel {
  late final String id;
  late final String ticketId;
  late final String fromStationId;
  late final String toStationId;

  Travel({
    required this.id,
    required this.ticketId,
    required this.fromStationId,
    required this.toStationId,
  });

  Travel.empty();

  factory Travel.fromJson(Map<String, dynamic> json) {
    return Travel(
      id: json['id'],
      ticketId: json['ticketId'],
      fromStationId: json['email'],
      toStationId: json['toStationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticketId': ticketId,
      'fromStationId': fromStationId,
      'toStationId': toStationId
    };
  }
}
