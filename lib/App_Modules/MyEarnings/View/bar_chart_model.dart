//ignore_for_file: prefer_const_constructors

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String year;
  int financial;
  charts.Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

final List<BarChartModel> data = [

  BarChartModel(
    year: "MON",
    financial: 500,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "TUE",
    financial: 400,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "WED",
    financial: 250,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "THU",
    financial: 300,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "FRI",
    financial: 250,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "SAT",
    financial: 400,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
  BarChartModel(
    year: "SUN",
    financial: 500,
    color: charts.ColorUtil.fromDartColor(Color(0xff017DD5)),
  ),
];
