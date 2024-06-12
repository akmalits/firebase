import 'package:fireeeee/provider/realtime_database_students_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fireeeee/model/student_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
              title: const Text('Realtime Database'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SfRadialGauge(
                    title: GaugeTitle(
                        text: provider.studentList!.isEmpty
                            ? ''
                            : provider.studentList!.last.studentData!.age!,
                        textStyle: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 14,
                          pointers: <GaugePointer>[
                            NeedlePointer(
                                value: provider.studentList!.isEmpty
                                    ? 0.0
                                    : double.parse(provider
                                        .studentList!.last.studentData!.age!),
                                enableAnimation: true)
                          ],
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startValue: 0,
                                endValue: 5,
                                color: Colors.green),
                            GaugeRange(
                                startValue: 5,
                                endValue: 10,
                                color: Colors.orange),
                            GaugeRange(
                                startValue: 10, endValue: 14, color: Colors.red)
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Text(
                                  '${provider.studentList!.isEmpty ? '' : provider.studentList!.last.studentData!.age!} pH',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                positionFactor: 0.5,
                                angle: 90)
                          ])
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${provider.studentList!.isEmpty ? '' : provider.studentList!.last.studentData!.age.toString()} pH',
                                style: const TextStyle(fontSize: 18)),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                provider.studentList!.isEmpty
                                    ? ''
                                    : DateFormat("dd-MM-yyyy HH:mm:ss").format(
                                        DateFormat("yyyy-MM-ddTHH:mm:ss").parse(
                                            provider.studentList!.last
                                                .studentData!.timestamp
                                                .toString(),
                                            true)),
                                style: const TextStyle(fontSize: 18)),
                          ],
                        ),
                      );
                    },
                    itemCount: 1,
                  ),
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
                      series: <CartesianSeries<Student, String>>[
                        LineSeries<Student, String>(
                            dataSource: provider.studentList!,
                            xValueMapper: (Student student, _) {
                              final timestampString =
                                  student.studentData!.timestamp;
                              if (timestampString != null) {
                                final date = DateFormat("yyyy-MM-ddTHH:mm:ss")
                                    .parse(timestampString, true);
                                return DateFormat("HH:mm:ss").format(date);
                              }
                              return '';
                            },
                            yValueMapper: (Student student, _) => double.parse(
                                student.studentData!.age.toString()),
                            name: 'pH',
                            // Enable data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ]),
                ],
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
