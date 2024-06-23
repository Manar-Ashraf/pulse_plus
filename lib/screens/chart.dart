import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/controllers/user_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class LiveHeartRateChart extends StatefulWidget {
  const LiveHeartRateChart({super.key});

  @override
  _LiveHeartRateChartState createState() => _LiveHeartRateChartState();
}

class _LiveHeartRateChartState extends State<LiveHeartRateChart> {
  List<HeartRateData> _chartData = [];
  ChartSeriesController? _chartSeriesController;
  StreamSubscription<QuerySnapshot>?_subscription;
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _subscribeToHeartRateData();
  }

  void _subscribeToHeartRateData() {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
    _subscription = usersCollection
        .doc(userController.getUserData!.data!.id) // Replace with your actual user ID or document path
        .collection('Filtered') // Replace with your filtered collection name
        .orderBy('created_at', descending: true)
        .limit(10)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      setState(() {
        _chartData = snapshot.docs.map((doc) {
          final timestamp = doc['created_at'] as Timestamp;
          return HeartRateData(
            timestamp.toDate(), // Convert Firestore Timestamp to DateTime
            doc['heart rate'].toDouble(), // Convert heart rate to double
          );
        }).toList();
      });

      // Update the chart's data source
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[0], // Assuming you always update the latest record
        removedDataIndexes: <int>[], // No data is removed since we are replacing the entire dataset
      );
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        backgroundColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Time'),
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Heart Rate (bpm)'),
          majorGridLines: MajorGridLines(width: 0),
        ),
        series: <LineSeries<HeartRateData, String>>[
          LineSeries<HeartRateData, String>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            color: const Color(0xFF7E1D19),
            dataSource: _chartData,
            xValueMapper: (HeartRateData hr, _) => hr.formattedTime,
            yValueMapper: (HeartRateData hr, _) => hr.rate.toPrecision(2),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class HeartRateData {
  HeartRateData(this.dateTime, this.rate);
  final DateTime dateTime;
  final double rate;

  String get formattedTime {
    final DateFormat formatter = DateFormat('HH:mm:ss');
    return formatter.format(dateTime.toLocal());
  }
}
