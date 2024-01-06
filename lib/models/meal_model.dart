class Meal {
  String id;
  String name;
  String image;
  int calories;
  String descriptions;
  bool popular;
  String timeOfDay;
  String forTheBody;
  String category;
  String userId;

  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.calories,
    required this.descriptions,
    required this.popular,
    required this.timeOfDay,
    required this.forTheBody,
    required this.category,
    required this.userId,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      calories: json['calories'],
      descriptions: json['descriptions'],
      popular: json['popular'],
      timeOfDay: json['timeOfDay'],
      forTheBody: json['forTheBody'],
      category: json['category'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'calories': calories,
      'descriptions': descriptions,
      'popular': popular,
      'timeOfDay': timeOfDay,
      'forTheBody': forTheBody,
      'category': category,
      'user_id': userId,
    };
  }
}

class TimeOfDays {
  String id;
  String image;
  String name;
  DateTime timeStart;
  DateTime timeEnd;

  TimeOfDays({
    required this.id,
    required this.image,
    required this.name,
    required this.timeStart,
    required this.timeEnd,
  });

  factory TimeOfDays.fromJson(Map<String, dynamic> json) {
    return TimeOfDays(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      timeStart: DateTime.parse(json['timeStart']),
      timeEnd: DateTime.parse(json['timeEnd']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'name': name,
      'timeStart': timeStart.toIso8601String(),
      'timeEnd': timeEnd.toIso8601String(),
    };
  }
}

class Category {
  String id;
  String name;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}
