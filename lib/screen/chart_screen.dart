import 'package:firebase_database/firebase_database.dart';
import 'package:fireeeee/model/sensor_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  List<Sensor>? _sensorList = [];
  List<Sensor>? get sensorList => _sensorList;
  fetchData() {
    dbRef.child("Sensors").onChildAdded.listen((data) {
      // Listen to the child added event
      SensorData sensorData = SensorData.fromJson(
          data.snapshot.value as Map); // Convert the data to StudentData object
      Sensor sensor = Sensor(
        key: data.snapshot.key,
        sensorData: sensorData,
      ); // Create a Student object

      if (_sensorList!.length > 30) {
        setState(() {
          _sensorList!.removeAt(0);
        });
      }

      setState(() {
        _sensorList!.add(sensor); // Add the student object to the list
      });
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              title: AxisTitle(text: 'Time'),
            ),
            // Chart title
            title: const ChartTitle(text: 'pH Historical Data Chart'),
            // Enable legend
            legend: const Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<Sensor, String>>[
              LineSeries<Sensor, String>(
                  dataSource: sensorList!,
                  xValueMapper: (Sensor sensor, _) {
                    final timestampString = sensor.sensorData!.timestamp;
                    if (timestampString != null) {
                      final date = DateFormat("yyyy-MM-ddTHH:mm:ss")
                          .parse(timestampString, true);
                      return DateFormat("HH:mm:ss").format(date);
                    }
                    return '';
                  },
                  yValueMapper: (Sensor sensor, _) =>
                      double.parse(sensor.sensorData!.ph.toString()),
                  name: 'pH',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]),
        SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              title: AxisTitle(text: 'Time'),
            ),
            // Chart title
            title: const ChartTitle(text: 'Temperature Historical Data Chart'),
            // Enable legend
            legend: const Legend(isVisible: true),

            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<Sensor, String>>[
              LineSeries<Sensor, String>(
                  dataSource: sensorList!,
                  xValueMapper: (Sensor sensor, _) {
                    final timestampString = sensor.sensorData!.timestamp;
                    if (timestampString != null) {
                      final date = DateFormat("yyyy-MM-ddTHH:mm:ss")
                          .parse(timestampString, true);
                      return DateFormat("HH:mm:ss").format(date);
                    }
                    return '';
                  },
                  yValueMapper: (Sensor sensor, _) =>
                      double.parse(sensor.sensorData!.temp.toString()),
                  name: 'Temperature',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]),
      ],
    );
  }
}
