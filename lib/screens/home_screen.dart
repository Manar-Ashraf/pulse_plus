import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/controllers/token_controller.dart';
import 'package:pulse_plus/controllers/user_controller.dart';
import 'package:pulse_plus/screens/chart.dart';
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


  @override
  Widget build(BuildContext context) {
    UserController userController =Get.put(UserController());
    // userController.fetchUserData();
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEF9A9A),
        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/refresh.png'),
        ),
        onPressed: (){
          // tokenController.getToken().then((value) => tokenController.getTok());
          userController.fetchUserData();
          Get.to(()=> LiveHeartRateChart());
        } ,
      ),

      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(height: 20),
            // _buildBarChart(),
            const SizedBox(height: 70),
            Center(child: Container(
              height: 300,
              width: 300,
              child:LiveHeartRateChart() ,
            ),),
            const SizedBox(height: 70),
             SemicircularIndicator(
              radius: 80,
              progress: (userController.getUserData!.data!.filterd!.first.heartRate!.toPrecision(2))/100,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFEEA6A3),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Obx( ()=> userController.isLoading.isFalse?
                    Text(
                      '${userController.getUserData?.data?.filterd?.first.heartRate!.toPrecision(2)}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7E1D19)),
                    ):Text('Loading...'),
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
              progress: (userController.getUserData!.data!.predicted!.first.heartRate!.toPrecision(2))/100,
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
                    ):Text('Loading...'),
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
            SemicircularIndicator(
              radius: 80,
              progress: 0.977,
              color: Color(0xFF7E1D19),
              backgroundColor: Color(0xFFEEA6A3),
              strokeWidth: 8,
              bottomPadding: 0,
              contain: true,
              child: Column(
                children: [
                  Text(
                    '97.6',
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
