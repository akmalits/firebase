import 'package:fireeeee/provider/realtime_database_students_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fireeeee/model/student_model.dart';

class RealTimeDatabase extends StatelessWidget {
  static const routeName = '/realtime_database_stless';

  const RealTimeDatabase({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: RealTimeDatabaseProvider(),
      child: Consumer<RealTimeDatabaseProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Realtime Database Stateless'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(
                  provider.studentList!.length,
                  (index) =>
                      studentWidget(context, provider.studentList![index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget studentWidget(BuildContext context, Student student) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(student.studentData!.name.toString()),
              Text(student.studentData!.age.toString()),
              Text(student.studentData!.subject.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
