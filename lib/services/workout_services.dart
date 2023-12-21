import 'dart:convert';
import 'package:fitness_app/configs/app_config.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:http/http.dart';

class WorkoutService {
  Future<List<Workout>> getAllWorkout() async {
    Response res = await get(
      Uri.parse('${config.baseUrl}workouts'),
    );
    if (res.statusCode == 200) {
      List<dynamic> jsonList = json.decode(res.body)['data'] ?? [];
      List<Workout> workouts =
          List.from(jsonList.map((jsonObject) => Workout.fromMap(jsonObject)));
      return workouts;
    } else {
      throw Exception('Failed to load workouts');
    }
  }
}
