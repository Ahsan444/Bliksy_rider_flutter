// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart_model.dart';

Widget barChart() {
  List<charts.Series<BarChartModel, String>> series = [
    charts.Series(
      id: "financial",
      data: data,
      domainFn: (BarChartModel series, _) => series.year,
      measureFn: (BarChartModel series, _) => series.financial,
      colorFn: (BarChartModel series, _) => series.color,

    ),
    
  ];
  return charts.BarChart(
    series,
    animate: true,
  );
}
