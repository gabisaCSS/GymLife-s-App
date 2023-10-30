import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_lifes_app/model/weight_model/weight_model.dart';
import 'package:intl/intl.dart';

class MyLineChart extends StatelessWidget {
  final List<WeightModel> points;
  const MyLineChart({super.key, required this.points});

  SideTitles get _bottomTitles {
    const maxVisibleTitles = 5; // Jumlah maksimal title yang akan ditampilkan
    final interval = (points.length / maxVisibleTitles).floor();
    return SideTitles(
        interval: 1,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          if (points.length > 30) {
            if (value >= 0 && value < points.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % interval == 0) {
                DateTime date = points[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              } else {
                return const Text('');
              }
            }
          } else if (points.length >= 20) {
            if (value >= 0 && value < points.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 4 == 0) {
                DateTime date = points[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (points.length >= 10) {
            if (value >= 0 && value < points.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 3 == 0) {
                DateTime date = points[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (points.length >= 5) {
            if (value >= 0 && value < points.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 2 == 0) {
                DateTime date = points[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }
            }
          } else if (points.length < 5) {
            if (value >= 0 && value < points.length) {
              int index = value.toInt();

              // Hanya tampilkan tanggal bulan pada titik-titik yang sesuai dengan interval
              if (index % 1 == 0) {
                DateTime date = points[index].date;
                final DateFormat formatter = DateFormat('dd MMM');
                final String text = formatter.format(date);

                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
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

  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
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
                        return LineTooltipItem(
                            '$dateString\n', const TextStyle(),
                            children: [TextSpan(text: '${flSpot.y} Kg')]);
                      }).toList();
                    })),
            lineBarsData: [
              LineChartBarData(
                spots: points
                    .mapIndexed((index, point) =>
                        FlSpot(index.toDouble(), point.weight))
                    .toList(),
                isCurved: false,
              )
            ],
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false))))),
      );
    } else if (points.length == 1) {
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
                        return LineTooltipItem(
                            '$dateString\n', const TextStyle(),
                            children: [TextSpan(text: '${flSpot.y} Kg')]);
                      }).toList();
                    })),
            lineBarsData: [
              LineChartBarData(
                spots: points
                    .mapIndexed((index, point) =>
                        FlSpot(index.toDouble(), point.weight))
                    .toList(),
                isCurved: false,
              )
            ],
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false))))),
      );
    }

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
}
