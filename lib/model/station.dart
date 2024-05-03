class Station {
  late final String id;
  late final String name;
  late final double latitude;
  late final double longitude;

  Station({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Station.empty();

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
