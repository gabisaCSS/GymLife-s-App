import 'package:flutter/material.dart';
import 'package:gym_lifes_app/screen/dashboard_screen/component/weight_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: WeightChart());
  }
}
