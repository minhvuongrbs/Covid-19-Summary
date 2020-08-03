import 'package:covid_summary/utils/translations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../app_constant.dart';

class CovidLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Chip(
              label: Text(
                Translations.text('new_cases'),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
          _buildStatistic(),
        ],
      ),
    );
  }

  Container _buildStatistic() => Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 25, left: 10),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                textStyle: const TextStyle(
                  color: AppConstant.secondTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                margin: 8,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '02/29';
                    case 2:
                      return '04/06';
                    case 3:
                      return '05/13';
                    case 4:
                      return '06/19';
                    case 5:
                      return '07/26';
                  }
                  return '';
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                textStyle: const TextStyle(
                  color: Color(0xff75729e),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return '0';
                    case 1:
                      return '100k';
                    case 2:
                      return '200k';
                    case 3:
                      return '300k';
                    case 4:
                      return '400k';
                  }
                  return '';
                },
                margin: 8,
                reservedSize: 30,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Color(0xff4e4965)),
                left: BorderSide(color: Colors.transparent),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            minX: 0,
            maxX: 5,
            maxY: 5,
            minY: 0,
            lineBarsData: linesBarData(),
          ),
        ),
      );
}

List<LineChartBarData> linesBarData() {
  final LineChartBarData newCasesChartData = LineChartBarData(
    spots: [
      FlSpot(0, 0),
      FlSpot(1, 1751 / 100000),
      FlSpot(2, 77198 / 100000),
      FlSpot(3, 81576 / 100000),
      FlSpot(4, 142441 / 100000),
      FlSpot(5, 204632 / 100000),
      FlSpot(5.2, 290940 / 100000),
    ],
    isCurved: false,
    colors: [Colors.blue],
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    // belowBarData: BarAreaData(show: false),
  );
  return [newCasesChartData];
}
