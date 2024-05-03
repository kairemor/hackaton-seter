class PointOfInterest {
  late final String id;
  late final String stationId;
  late final String type;
  late final double latitude;
  late final double longitude;
  late final String detail;

  PointOfInterest({
    required this.id,
    required this.stationId,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.detail,
  });

  PointOfInterest.empty();

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      id: json['id'],
      stationId: json['stationId'],
      type: json['type'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stationId': stationId,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
      'detail': detail,
    };
  }
}
