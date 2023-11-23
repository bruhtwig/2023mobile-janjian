class Agenda {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? location;
  DateTime? startDate;
  DateTime? endDate;

  Agenda({this.userId, this.name, this.description, this.location, this.startDate, this.endDate, this.id});

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
    userId: json["user_id"],
    name: json["name"],
    description: json["description"],
    location: json["location"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "location": location,
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
  };
}