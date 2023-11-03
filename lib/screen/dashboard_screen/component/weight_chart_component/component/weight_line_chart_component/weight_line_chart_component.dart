import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';
import 'package:gym_lifes_app/screen/training_screen.dart/components/training_chart_component.dart/component/app_color.dart';
import 'package:intl/intl.dart';

class WeightLineChartComponent extends StatelessWidget {
  final List<WeightModel> weightList;
  const WeightLineChartComponent({super.key, required this.weightList});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          lineChartWeightData,
        ));
  }

  LineChartData get lineChartWeightData => LineChartData(
      minX: 0,
      maxX: weightList.length.toDouble() - 1,
      minY: 0,
      maxY: 100,
      gridData: const FlGridData(show: false),
      lineBarsData: lineBarsWeightData,
      lineTouchData: lineTouchWeightData,
      borderData: borderData,
      titlesData: titlesWeightData);

  List<LineChartBarData> get lineBarsWeightData => [
        lineChartBarData1,
      ];

  LineChartBarData get lineChartBarData1 => LineChartBarData(
        isCurved: true,
        // curveSmoothness: 0,
        barWidth: 3,
        color: AppColors.contentColorGreen.withOpacity(0.5),
        belowBarData: BarAreaData(
          show: true,
          color: AppColors.contentColorGreen.withOpacity(0.2),
        ),
        // barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: weightList.length == 1),

        spots: weightList
            .mapIndexed(
                (index, weight) => FlSpot(index.toDouble(), weight.weight))
            .toList(),
      );

  FlTitlesData get titlesWeightData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: _bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 25,
          ),
        ),
      );

  FlTitlesData get titlesSetAndRepData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: _bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 4,
          ),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineTouchData get lineTouchWeightData =>
      LineTouchData(touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
        // ubah konten data yang ditampilkan saat di tekan
        return touchedBarSpots.map((lineBar) {
          final DateTime date = weightList[lineBar.x.toInt()].date;
          final DateFormat formatter = DateFormat('dd MMM');
          final String dateString = formatter.format(date);
          return LineTooltipItem(
              '$dateString\n', const TextStyle(color: Colors.white), children: [
            TextSpan(
                text: '${lineBar.y} Kg',
                style: const TextStyle(color: Colors.white))
          ]);
        }).toList();
      }));

  LineTouchData get lineTouchSetAndRepData => LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.mapIndexed((index, lineBar) {
              final DateTime date = weightList[lineBar.x.toInt()].date;
              final DateFormat formatter = DateFormat('dd MMM');
              final String dateString = formatter.format(date);
              if (index == 0) {
                return LineTooltipItem(
                    '$dateString\n', const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                          text: '${lineBar.y.toStringAsFixed(0)} Rep',
                          style: const TextStyle(color: Colors.white))
                    ]);
              } else if (index == 1) {
                return LineTooltipItem(
                  '${lineBar.y.toStringAsFixed(0)} Set',
                  const TextStyle(color: Colors.white),
                );
              }
            }).toList();
          },
        ),
      );

  SideTitles get _bottomTitles {
    const maxVisibleTitles = 5; // Jumlah maksimal title yang akan ditampilkan
    final interval = (weightList.length / maxVisibleTitles).floor();
    return SideTitles(
        reservedSize: 44,
        interval: 1,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          if (weightList.length > 30) {
            if (value >= 0 && value < weightList.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % interval == 0) {
                DateTime date = weightList[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              } else {
                return const Text('');
              }
            }
          } else if (weightList.length >= 20) {
            if (value >= 0 && value < weightList.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 4 == 0) {
                DateTime date = weightList[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (weightList.length >= 10) {
            if (value >= 0 && value < weightList.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 3 == 0) {
                DateTime date = weightList[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (weightList.length >= 5) {
            if (value >= 0 && value < weightList.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 2 == 0) {
                DateTime date = weightList[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (weightList.length < 5) {
            if (value >= 0 && value < weightList.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 1 == 0) {
                DateTime date = weightList[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          }

          return const SizedBox();
        });
  }
}
