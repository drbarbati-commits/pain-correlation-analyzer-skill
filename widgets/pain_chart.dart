import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Time-series pain visualization widget
class PainTimelineChart extends StatelessWidget {
  final List<PainDataPoint> dataPoints;
  final DateTime startDate;
  final DateTime endDate;
  
  const PainTimelineChart({
    super.key,
    required this.dataPoints,
    required this.startDate,
    required this.endDate,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString());
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date = DateTime.fromMillisecondsSinceEpoch(
                    value.toInt(),
                  );
                  return Text('${date.day}/${date.month}');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints
                  .map((p) => FlSpot(
                        p.timestamp.millisecondsSinceEpoch.toDouble(),
                        p.painScore,
                      ))
                  .toList(),
              isCurved: true,
              color: Colors.red,
              barWidth: 3,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}

class PainDataPoint {
  final DateTime timestamp;
  final double painScore;
  
  PainDataPoint({required this.timestamp, required this.painScore});
}
