import 'dart:convert';

class Workout {
  String name;
  String imageUrl;
  List<WorkoutDetail> details;

  Workout(this.imageUrl, this.name, this.details);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'details': details.map((detail) => detail.toMap()).toList(),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      map['imageUrl'] ?? '',
      map['name'] ?? '',
      (map['details'] as List<dynamic>?)
              ?.map((detail) => WorkoutDetail.fromMap(detail))
              .toList() ??
          [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Workout.fromJson(String source) =>
      Workout.fromMap(json.decode(source));
}

class WorkoutDetail {
  String imageUrl;
  String name;
  int timeSeconds;
  String description;
  String videoUrl;
  int calories;

  WorkoutDetail(
    this.imageUrl,
    this.name,
    this.timeSeconds,
    this.description,
    this.videoUrl,
    this.calories,
  );

  Map<String, dynamic> toMap() {
    return {
      'image': imageUrl,
      'name': name,
      'timeSeconds': timeSeconds,
      'description': description,
      'videoUrl': videoUrl,
      'calories': calories,
    };
  }

  factory WorkoutDetail.fromMap(Map<String, dynamic> map) {
    return WorkoutDetail(
      map['imageUrl'] ?? '',
      map['name'] ?? '',
      map['timeSeconds'] ?? 0,
      map['description'] ?? '',
      map['videoUrl'] ?? '',
      map['calories'] ?? 0,
    );
  }
}

class WorkoutProgress {
  final int? progress;
  final Workout? workout;

  WorkoutProgress({this.progress, this.workout});

  factory WorkoutProgress.fromMap(Map<String, dynamic> map) {
    return WorkoutProgress(
      progress: map['progress'] ?? 0,
      workout: map['workout'] != null ? Workout.fromMap(map['workout']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'progress': progress,
      'workout': workout?.toMap(),
    };
  }
}
