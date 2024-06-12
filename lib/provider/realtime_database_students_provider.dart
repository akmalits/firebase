import 'package:firebase_database/firebase_database.dart';
import 'package:fireeeee/model/student_model.dart';
import 'package:flutter/material.dart';

class RealTimeDatabaseProvider extends ChangeNotifier {
  RealTimeDatabaseProvider() {
    fetchData();
  }

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  List<Student>? _studentList = [];
  List<Student>? get studentList => _studentList;

  bool? _condition = false;
  bool? get condition => _condition;

  getCondition() {
    _condition = !_condition!;
    notifyListeners();
  }

  fetchData() {
    dbRef.child("Students").onChildAdded.listen((data) {
      // Listen to the child added event
      StudentData studentData = StudentData.fromJson(
          data.snapshot.value as Map); // Convert the data to StudentData object
      Student student = Student(
        key: data.snapshot.key,
        studentData: studentData,
      ); // Create a Student object

      _studentList!.add(student); // Add the student object to the list

      notifyListeners();
    });
  }
}
