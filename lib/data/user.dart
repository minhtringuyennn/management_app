class User {
  final String name;
  final String picture;
  final double curStat;
  final int maxStat;
  final int hasAbsent;
  final int maxAbsent;

  List<Activity> activities;

  User({
    required this.name,
    required this.picture,
    required this.curStat,
    required this.maxStat,
    required this.hasAbsent,
    required this.maxAbsent,
    required this.activities,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final originList = json['activity'] as List;
    List<Activity> _activities =
        originList.map((value) => Activity.fromJson(value)).toList();
    return User(
      name: json['name'],
      picture: json['picture'],
      curStat: json['curStat'],
      maxStat: json['maxStat'],
      hasAbsent: json['hasAbsent'],
      maxAbsent: json['maxAbsent'],
      activities: _activities,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'picture': picture,
        'curStat': curStat,
        'maxStat': maxStat,
        'hasAbsent': hasAbsent,
        'maxAbsent': maxAbsent,
      };
}

class Activity {
  final String description;
  final String type;
  final int date;
  final int month;
  final int year;

  Activity({
    required this.description,
    required this.type,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      description: json['description'],
      type: json['type'],
      date: json['date'],
      month: json['month'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'type': type,
        'date': date,
        'month': month,
        'year': year,
      };
}
