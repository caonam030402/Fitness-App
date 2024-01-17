import 'dart:convert';
import 'package:fitness_app/configs/app_config.dart';
import 'package:fitness_app/models/meal_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      return meals;
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  addMealPlannerForUser(String mealPlannerId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user-id');
    String url = '${config.baseUrl}meal-planner/$userId';
    String body = jsonEncode({"mealPlanner": mealPlannerId});

    Response res = await post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (res.statusCode == 201) {
      await EasyLoading.showSuccess('Great Success!',
          duration: Duration(seconds: 2),
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: true);
      print('Add Thành công');
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
