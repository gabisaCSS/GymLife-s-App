class TrainingModel {
  final int? id;
  final String exerciseName;
  final int sets;
  final int reps;
  final double weight;
  final DateTime date;

  const TrainingModel(
      {this.id,
      required this.weight,
      required this.date,
      required this.exerciseName,
      required this.sets,
      required this.reps});

  Map<String, dynamic> toMap() {
    int dateInt = date.millisecondsSinceEpoch;
    return {
      'exercise_name': exerciseName.toLowerCase(),
      'sets': sets,
      'reps': reps,
      'weight': weight,
      'dateInt': dateInt,
    };
  }

  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    DateTime dateFromMap = DateTime.fromMillisecondsSinceEpoch(map['dateInt']);
    return TrainingModel(
      id: map['id'],
      exerciseName: map['exercise_name'],
      sets: map['sets'],
      reps: map['reps'],
      date: dateFromMap,
      weight: map['weight'],
    );
  }
}
