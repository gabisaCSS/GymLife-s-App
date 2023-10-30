class WeightModel {
  final int? id;
  final double weight;
  final DateTime date;

  const WeightModel({this.id, required this.weight, required this.date});

  Map<String, dynamic> toMap() {
    int dateInt = date.millisecondsSinceEpoch;
    return {'weight': weight, 'date': dateInt};
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    DateTime dateFromMap = DateTime.fromMillisecondsSinceEpoch(map['date']);
    return WeightModel(id: map['id'], weight: map['weight'], date: dateFromMap);
  }
}
