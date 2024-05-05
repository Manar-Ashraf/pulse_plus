import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String hour;
  int bpm;
  final charts.Color color;

  BarChartModel({
    required this.hour,
    required this.bpm,
    required this.color,
  });
}

class Chart extends StatelessWidget {
  Chart({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      hour: "2:00",
      bpm: 79,
      color: charts.ColorUtil.fromDartColor(Color(0xFF7E1D19)),
    ),
    BarChartModel(
      hour: "4:00",
      bpm: 80,
      color: charts.ColorUtil.fromDartColor(Color(0xFFEF9A9A)),
    ),
    BarChartModel(
      hour: "6:00",
      bpm: 76,
      color: charts.ColorUtil.fromDartColor(Color(0xFF7E1D19)),
    ),
    BarChartModel(
      hour: "8:00",
      bpm: 79,
      color: charts.ColorUtil.fromDartColor(Color(0xFFEF9A9A)),
    ),
    BarChartModel(
      hour: "10:00",
      bpm: 83,
      color: charts.ColorUtil.fromDartColor(Color(0xFF7E1D19)),
    ),
    BarChartModel(
      hour: "12:00",
      bpm: 89,
      color: charts.ColorUtil.fromDartColor(Color(0xFFEF9A9A)),
    ),
    BarChartModel(
      hour: "14:00",
      bpm: 82,
      color: charts.ColorUtil.fromDartColor(Color(0xFF7E1D19)),
    ),
    BarChartModel(
      hour: "16:00",
      bpm: 78,
      color: charts.ColorUtil.fromDartColor(Color(0xFFEF9A9A)),
    ),
    BarChartModel(
      hour: "18:00",
      bpm: 75,
      color: charts.ColorUtil.fromDartColor(Color(0xFF7E1D19)),
    ),
    BarChartModel(
      hour: "20:00",
      bpm: 70,
      color: charts.ColorUtil.fromDartColor(Color(0xFFEF9A9A)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Heart Rate",
        data: data,
        domainFn: (BarChartModel series, _) => series.hour,
        measureFn: (BarChartModel series, _) => series.bpm,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Rate",
            style: TextStyle(
                color: Color(0xFF7E1D19),
                fontSize: 24,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE5E7),
      ),
      backgroundColor: const Color(0xFFFFE5E7),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
