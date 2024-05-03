class Ticket {
  late final String id;
  late final String fromStationId;
  late final String toStationId;
  late final String className;
  late final String passengerNumber;
  late final bool roundTrip;
  late final String validityLength;

  Ticket({
    required this.id,
    required this.fromStationId,
    required this.toStationId,
    required this.className,
    required this.passengerNumber,
    required this.roundTrip,
    required this.validityLength,
  });

  Ticket.empty();

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      fromStationId: json['username'],
      toStationId: json['email'],
      className: json['className'],
      passengerNumber: json['passengerNumber'],
      roundTrip: json['roundTrip'],
      validityLength: json['validityLength'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fromStationId': fromStationId,
      'toStationId': toStationId,
      'className': className,
      'passengerNumber': passengerNumber,
      'roundTrip': roundTrip,
      'validityLength': validityLength,
    };
  }
}
