import 'package:flutter/material.dart';
import 'package:pulse_plus/screens/doctor_info.dart';
import 'package:pulse_plus/screens/user_profile.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:pulse_plus/screens/sign_in_screen.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart {
  String hour;
  int bpm;
  final charts.Color color;

  BarChart({
    required this.hour,
    required this.bpm,
    required this.color,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildBarChart() {
    List<charts.Series<BarChart, String>> series = [
      charts.Series(
        id: "Heart Rate",
        data: [
          BarChart(
            hour: "2:00",
            bpm: 79,
            color: charts.ColorUtil.fromDartColor(const Color(0xFF7E1D19)),
          ),
          BarChart(
            hour: "4:00",
            bpm: 80,
            color: charts.ColorUtil.fromDartColor(const Color(0xFFEF9A9A)),
          ),
          BarChart(
            hour: "6:00",
            bpm: 76,
            color: charts.ColorUtil.fromDartColor(const Color(0xFF7E1D19)),
          ),
          BarChart(
            hour: "8:00",
            bpm: 79,
            color: charts.ColorUtil.fromDartColor(const Color(0xFFEF9A9A)),
          ),
          BarChart(
            hour: "10:00",
            bpm: 83,
            color: charts.ColorUtil.fromDartColor(const Color(0xFF7E1D19)),
          ),
          BarChart(
            hour: "12:00",
            bpm: 89,
            color: charts.ColorUtil.fromDartColor(const Color(0xFFEF9A9A)),
          ),
          BarChart(
            hour: "14:00",
            bpm: 82,
            color: charts.ColorUtil.fromDartColor(const Color(0xFF7E1D19)),
          ),
          BarChart(
            hour: "16:00",
            bpm: 78,
            color: charts.ColorUtil.fromDartColor(const Color(0xFFEF9A9A)),
          ),
          BarChart(
            hour: "18:00",
            bpm: 75,
            color: charts.ColorUtil.fromDartColor(const Color(0xFF7E1D19)),
          ),
          BarChart(
            hour: "20:00",
            bpm: 70,
            color: charts.ColorUtil.fromDartColor(const Color(0xFFEF9A9A)),
          ),
        ],
        domainFn: (BarChart series, _) => series.hour,
        measureFn: (BarChart series, _) => series.bpm,
        colorFn: (BarChart series, _) => series.color,
      ),
    ];
    return SizedBox(
      height: 500,
      child: charts.BarChart(
        series,
        animate: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(children: [
                  PopupMenuButton<String>(
                    color: Colors.red[200],
                    onSelected: (String value) {
                      switch (value) {
                        case 'Screen 1':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => const Profile()));
                          break;
                        case 'Screen 2':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => const Doctor()));
                          break;
                        case 'Screen 3':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => SignInScreen()));
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'Screen 1',
                        child: Text('Profile'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Screen 2',
                        child: Text('Report to Doctor'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Screen 3',
                        child: Text('Sign Out'),
                      ),
                    ],
                  ),
                ])),
            const SizedBox(height: 20),
            _buildBarChart(),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.665,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFEEA6A3),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '66.5',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Latest BPM',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.696,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFF5A29C),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '69.6',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Predicted BPM',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            const SemicircularIndicator(
              radius: 80,
              progress: 0.978,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFF5A29C),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '97.8',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                  Text(
                    'Oxygen Level',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E1D19)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
