import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/controllers/token_controller.dart';
import 'package:pulse_plus/controllers/user_controller.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
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

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
   TokenController tokenController = Get.put(TokenController());
   UserController userController = Get.put(UserController());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TokenController tokenController = Get.put(TokenController());
  // UserController userController = Get.put(UserController());


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
    UserController userController =Get.put(UserController());
    // userController.fetchUserData();
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // tokenController.getToken().then((value) => tokenController.getTok());
          userController.fetchUserData();
        } ,
      ),

      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
             SemicircularIndicator(
              radius: 80,
              progress: 0.696,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFF5A29C),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Obx( ()=> userController.isLoading.isFalse?
                    Text(
                      "${userController.getUserData!.data!.predicted!.first.heartRate!.toPrecision(2)}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7E1D19)),
                    ):const SizedBox.shrink(),
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
          ],
        ),
      ),
    );
  }
}
