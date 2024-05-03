class Payment {
  late final String id;
  late final String ticketId;
  late final String subscriptionId;
  late final String service;
  late final DateTime date;

  Payment({
    required this.id,
    required this.ticketId,
    required this.subscriptionId,
    required this.service,
    required this.date,
  });

  Payment.empty();

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      ticketId: json['ticketId'],
      subscriptionId: json['subscriptionId'],
      service: json['service'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticketId': ticketId,
      'subscriptionId': subscriptionId,
      'service': service,
      'date': date.toIso8601String(),
    };
  }
}
