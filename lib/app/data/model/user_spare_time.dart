class UserSpareTime {
  int? id;
  int? userId;
  DateTime? startDate;
  DateTime? endDate;

  UserSpareTime({
    this.userId, this.startDate, this.endDate, this.id,
  });

  factory UserSpareTime.fromJson(Map<String, dynamic> json) => UserSpareTime(
    id: json["id"],
    userId: json["user_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate!.toIso8601String(),
    "end_date": endDate!.toIso8601String(),
  };
}