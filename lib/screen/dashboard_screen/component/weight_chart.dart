import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class WeightChart extends StatelessWidget {
  List<WeightModel> points = [
    WeightModel(weight: 66, date: DateTime.now()),
    WeightModel(weight: 67, date: DateTime.now().add(const Duration(days: 1))),
    WeightModel(weight: 90, date: DateTime.now().add(const Duration(days: 2))),
    WeightModel(weight: 40, date: DateTime.now().add(const Duration(days: 3))),
    WeightModel(weight: 70, date: DateTime.now().add(const Duration(days: 4))),
    WeightModel(weight: 71, date: DateTime.now().add(const Duration(days: 5))),
    WeightModel(weight: 72, date: DateTime.now().add(const Duration(days: 6))),
    WeightModel(weight: 73, date: DateTime.now().add(const Duration(days: 7))),
    WeightModel(weight: 74, date: DateTime.now().add(const Duration(days: 8))),
    WeightModel(weight: 75, date: DateTime.now().add(const Duration(days: 9))),
    WeightModel(weight: 72, date: DateTime.now().add(const Duration(days: 10))),
  ];
  WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(
          minX: -1,
          maxX: points.length.toDouble(),
          minY: 0,
          maxY: 150,
          lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.amber,
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    // ubah konten data yang ditampilkan saat di tekan
                    return touchedBarSpots.map((flSpot) {
                      final DateTime date = points[flSpot.x.toInt()].date;
                      final DateFormat formatter = DateFormat('dd MMM');
                      final String dateString = formatter.format(date);
                      return LineTooltipItem('$dateString\n', const TextStyle(),
                          children: [TextSpan(text: '${flSpot.y} Kg')]);
                    }).toList();
                  })),
          lineBarsData: [
            LineChartBarData(
              spots: points
                  .mapIndexed(
                      (index, point) => FlSpot(index.toDouble(), point.weight))
                  .toList(),
              isCurved: false,
              dotData: const FlDotData(
                show: false,
              ),
            )
          ],
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false))))),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        if (value % 1 == 0 && value >= 0 && value < points.length) {
          int index = value.toInt();

          int miliSecond = points[index].date.millisecondsSinceEpoch;

          DateTime date = DateTime.fromMillisecondsSinceEpoch(miliSecond);
          final DateFormat formatter = DateFormat('dd MMM');

          final String text = formatter.format(date);

          return Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          );
        } else {
          return const Text('');
        }
      });
}
