import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/workout/startWorkout/widgets/partWorkout.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({super.key});

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final List<WorkoutDetail> workoutDetail =
        ModalRoute.of(context)!.settings.arguments as List<WorkoutDetail>;

    return Scaffold(
        backgroundColor: AppColors.gray_3,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: workoutDetail
                  .asMap()
                  .map((index, workout) {
                    return MapEntry(
                      index,
                      PartWorkout(
                        totalPartWorkout: workoutDetail.length,
                        workoutDetail: workout,
                        controllerPage: _controller,
                        indexWorkout: index,
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ],
        ));
  }
}

class StartWorkoutClass {
  String name;
  int time;
  String descriptions;
  StartWorkoutClass(this.name, this.time, this.descriptions);
}

List<StartWorkoutClass> startWorkUps = [
  StartWorkoutClass('Jumping Jack 1', 30,
      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
  StartWorkoutClass('Jumping Jack 2', 40,
      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
  StartWorkoutClass('Jumping Jack 3', 34,
      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
  StartWorkoutClass('Jumping Jack 4', 34,
      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
  StartWorkoutClass('Jumping Jack 5', 34,
      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.')
];
