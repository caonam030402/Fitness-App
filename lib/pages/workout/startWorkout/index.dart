import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pages/workout/startWorkout/widgets/partWorkout.dart';
import 'package:fitness_app/providers/musicProvider.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({Key? key}) : super(key: key);

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  late PageController _controller;
  late MusicProvider musicProvider;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    Future.delayed(Duration.zero, () {
      musicProvider = Provider.of<MusicProvider>(context, listen: false);
      player.play(AssetSource(musicProvider.currentSong));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    player.stop();
    super.dispose();
  }

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
            physics: NeverScrollableScrollPhysics(),
            children: workoutDetail
                .asMap()
                .map((index, workout) {
                  final key = PageStorageKey<String>('page_$index');
                  return MapEntry(
                    index,
                    PartWorkout(
                      key: key,
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
      ),
    );
  }
}
