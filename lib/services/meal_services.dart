import 'dart:convert';
import 'package:fitness_app/configs/app_config.dart';
import 'package:fitness_app/models/meal_model.dart';

import 'package:http/http.dart';

class MealService {
  Future<List<Meal>> getAllMeal({String? idUser, String? field}) async {
    String url = '${config.baseUrl}meal-planner';

    if (idUser != null) {
      url += '/$idUser';
    }

    if (field != null) {
      url += '?field=$field';
    }

    Response res = await get(
      Uri.parse(url),
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonList = json.decode(res.body)['data'] ?? [];
      List<Meal> meals =
          List.from(jsonList.map((jsonObject) => Meal.fromJson(jsonObject)));
      // print(jsonList);
      return meals;
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  Future<List<Category>> getCategories() async {
    String url = '${config.baseUrl}meal-planner/categories';

    Response res = await get(
      Uri.parse(url),
    );

    if (res.statusCode == 200) {
      List<dynamic> jsonList = json.decode(res.body)['data'] ?? [];
      List<Category> categories = List.from(
          jsonList.map((jsonObject) => Category.fromJson(jsonObject)));
      return categories;
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  Future<List<TimeOfDays>> getTimeOfDay() async {
    String url = '${config.baseUrl}meal-planner/time-of-day';

    Response res = await get(
      Uri.parse(url),
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> jsonList = json.decode(res.body)['data'] ?? [];
      List<TimeOfDays> timeOfDay = List.from(
          jsonList.map((jsonObject) => TimeOfDays.fromJson(jsonObject)));
      return timeOfDay;
    } else {
      throw Exception('Failed to load workouts');
    }
  }
}
