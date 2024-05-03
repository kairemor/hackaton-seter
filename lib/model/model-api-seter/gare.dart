class Gare {
  late final String? id;
  late final String? nom;
  late final DateTime? heure_ouverture;
  late final DateTime? heure_fermeture;
  late final bool place_parking;
  late final bool parvis;
  late final bool agence;

  Gare({
    required this.nom,
    required this.heure_fermeture,
    required this.heure_ouverture,
    required this.place_parking,
    required this.parvis,
    required this.agence,
    this.id
  });

  Gare.empty();

  factory Gare.fromJson(Map<dynamic, dynamic> json) {
    return Gare(
      id: json["id"] ?? "",
      nom: json["nom"] ?? "",
      heure_ouverture: json["heure_ouverture"] ?? "",
      heure_fermeture: json["heure_fermeture"] ?? "",
      place_parking: json["place_parking"] ?? "",
      parvis: json["parvis"] ?? "",
      agence: json["agence"] ?? ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'heure_ouverture': heure_ouverture,
      'heure_fermeture': heure_fermeture,
      'place_parking': place_parking,
      'parvis': parvis,
      'agence': agence,
    };
  }
}