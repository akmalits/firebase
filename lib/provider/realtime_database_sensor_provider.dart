import 'package:firebase_database/firebase_database.dart';
import 'package:fireeeee/model/sensor_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RealTimeDatabaseProviderSensor extends ChangeNotifier {
  RealTimeDatabaseProviderSensor() {
    fetchData();
  }

  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref(); // Database reference object

  List<Sensor>? _sensorList = [];
  List<Sensor>? get sensorList => _sensorList;

  bool? _condition = false;
  bool? get condition => _condition;

  getCondition() {
    _condition = !_condition!;
    notifyListeners();
  }

  fetchData() {
    dbRef.child("Sensors").onChildAdded.listen((data) {
      // Listen to the child added event
      SensorData sensorData = SensorData.fromJson(
          data.snapshot.value as Map); // Convert the data to StudentData object
      Sensor sensor = Sensor(
        key: data.snapshot.key,
        sensorData: sensorData,
      ); // Create a Student object

      if (_sensorList!.length > 60) {
        // If the list has more than 60 students
        _sensorList!.removeAt(0);
        notifyListeners();
      } else {
        _sensorList!.add(sensor); // Add the student object to the list
        notifyListeners();
      }
    });
  }

  //==========================GRAPH============================

  TrackballBehavior? _trackballBehaviors;

  TrackballBehavior? get trackballBehaviors => _trackballBehaviors;

  List<Color> color = [
    const Color(0xFF08A3AA),
    const Color(0xFF1766C5),
    const Color(0xFFEF3F3F),
    const Color(0xFFC12F87),
    const Color(0xFF16777B),
    const Color(0xFF0F3A6D),
    const Color(0xFFAD2626),
    const Color(0xFF882B47),
    const Color(0xFF0FCAA8),
    const Color(0xFF73B3FF),
    const Color(0xFFFF6B17),
    const Color(0xFFBB6BD9),
    const Color(0xFF78CA0F),
    const Color(0xFF00C7F2),
    const Color(0xFFF2994A),
    const Color(0xFF695CFB),
    const Color(0xFF467A05),
    const Color(0xFF7392FF),
    const Color(0xFF984B04),
    const Color(0xFF491C02),
    const Color(0xFF08A3AA),
    const Color(0xFF1766C5),
    const Color(0xFFEF3F3F),
    const Color(0xFFC12F87),
    const Color(0xFF16777B),
    const Color(0xFF0F3A6D),
    const Color(0xFFAD2626),
    const Color(0xFF882B47),
    const Color(0xFF0FCAA8),
    const Color(0xFF73B3FF),
    const Color(0xFFFF6B17),
    const Color(0xFFBB6BD9),
    const Color(0xFF78CA0F),
    const Color(0xFF00C7F2),
    const Color(0xFFF2994A),
    const Color(0xFF695CFB),
    const Color(0xFF467A05),
    const Color(0xFF7392FF),
    const Color(0xFF984B04),
    const Color(0xFF491C02),
    const Color(0xFF08A3AA),
    const Color(0xFF1766C5),
    const Color(0xFFEF3F3F),
    const Color(0xFFC12F87),
    const Color(0xFF16777B),
    const Color(0xFF0F3A6D),
    const Color(0xFFAD2626),
    const Color(0xFF882B47),
    const Color(0xFF0FCAA8),
    const Color(0xFF73B3FF),
    const Color(0xFFFF6B17),
    const Color(0xFFBB6BD9),
    const Color(0xFF78CA0F),
    const Color(0xFF00C7F2),
    const Color(0xFFF2994A),
    const Color(0xFF695CFB),
    const Color(0xFF467A05),
    const Color(0xFF7392FF),
    const Color(0xFF984B04),
    const Color(0xFF491C02),
    const Color(0xFF08A3AA),
    const Color(0xFF1766C5),
    const Color(0xFFEF3F3F),
    const Color(0xFFC12F87),
    const Color(0xFF16777B),
    const Color(0xFF0F3A6D),
    const Color(0xFFAD2626),
    const Color(0xFF882B47),
    const Color(0xFF0FCAA8),
    const Color(0xFF73B3FF),
    const Color(0xFFFF6B17),
    const Color(0xFFBB6BD9),
    const Color(0xFF78CA0F),
    const Color(0xFF00C7F2),
    const Color(0xFFF2994A),
    const Color(0xFF695CFB),
    const Color(0xFF467A05),
    const Color(0xFF7392FF),
    const Color(0xFF984B04),
    const Color(0xFF491C02),
  ];
}
