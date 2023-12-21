class Workout {
  String mainName;
  String mainImage;
  List<WorkoutDetail> workoutDetail;
  Workout(this.mainImage, this.mainName, this.workoutDetail);
}

class WorkoutDetail {
  String image;
  String name;
  int timeSeconds;
  String desciption;
  String video;
  int colories;
  WorkoutDetail(this.image, this.name, this.timeSeconds, this.desciption,
      this.video, this.colories);
}
