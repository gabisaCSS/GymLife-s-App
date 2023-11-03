import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class NutritionPieChartWidget extends StatelessWidget {
  final Map<String, double> mapData;
  final double chartRadius;
  final ChartType chartType;
  final String? centerText;
  final LegendPosition legendPosition;
  const NutritionPieChartWidget(
      {super.key,
      required this.mapData,
      this.chartRadius = 125,
      this.chartType = ChartType.disc,
      this.centerText,
      this.legendPosition = LegendPosition.right});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: mapData,
      chartRadius: chartRadius,
      centerText: centerText,
      chartType: chartType,
      ringStrokeWidth: 48,
      chartLegendSpacing: 64,
      legendOptions: LegendOptions(
        legendPosition: legendPosition,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValuesOutside: true,
      ),
    );
  }
}
