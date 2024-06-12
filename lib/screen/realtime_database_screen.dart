import 'package:fireeeee/provider/realtime_database_students_provider.dart';
import 'package:flutter/material.dart';
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
              title: const Text('Realtime Database Stateless'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // SfCartesianChart(
                  //     primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Time')),
                  //     // Enable legend
                  //     palette: provider.color,
                  //     legend: Legend(
                  //       isVisible: true,
                  //       position: LegendPosition.bottom,
                  //       overflowMode: LegendItemOverflowMode.wrap,
                  //     ),
                  //     // Enable tooltip
                  //     tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
                  //     plotAreaBorderWidth: 0,
                  //     primaryYAxis: NumericAxis(
                  //       edgeLabelPlacement: EdgeLabelPlacement.shift,
                  //       majorGridLines: const MajorGridLines(width: 0),
                  //       // title: AxisTitle(text: 'Value', textStyle: AppTextStyles.baseTextStyle(fontWeight: FontWeight.w500)),
                  //     ),
                  //     trackballBehavior: provider.trackballBehaviors,
                  //     zoomPanBehavior: ZoomPanBehavior(enablePinching: true, enablePanning: true),
                  //     series: List.generate(provider.studentList!.length, (index) {
                  //       return LineSeries<Student, String>(
                  //           dataSource: provider.studentList,
                  //           xValueMapper: (Student data, _) => data.studentData!.age,
                  //           yValueMapper: (Student data, _) => num.parse(data.studentData!.age!),
                  //           name: provider.studentList![index].studentData!.name!,
                  //           enableTooltip: true,
                  //           markerSettings: const MarkerSettings(isVisible: true, width: 2),
                  //           animationDuration: 2500,
                  //           width: 5,
                  //           legendIconType: LegendIconType.circle,
                  //           // Enable data label
                  //           dataLabelSettings: const DataLabelSettings(isVisible: false));
                  //     })
                  //
                  //   // series: <ChartSeries<Datas, String>>
                  //   // [
                  //   //   LineSeries<Datas, String>(
                  //   //       dataSource: provider.listData,
                  //   //       color: fourthColor,
                  //   //       xValueMapper: (Datas data, _) {
                  //   //         if (provider.minutes != null || provider.hour != null) {
                  //   //           var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(data.times!, true);
                  //   //           var n = DateFormat("HH:mm:ss").format(date.toLocal());
                  //   //           return n;
                  //   //         } else {
                  //   //           var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(data.times!, true);
                  //   //           var n = DateFormat("MM-dd HH:mm:ss").format(date.toLocal());
                  //   //           return n;
                  //   //         }
                  //   //       },
                  //   //       yValueMapper: (Datas data, _) => data.val,
                  //   //       name: 'Telemetry',
                  //   //       enableTooltip: true,
                  //   //       animationDuration: 2500,
                  //   //       width: 1,
                  //   //       // Enable data label
                  //   //       dataLabelSettings: DataLabelSettings(isVisible: false)),
                  //   //   LineSeries<Datas, String>(
                  //   //       dataSource: provider.allData![2].datas!,
                  //   //       color: Colors.red,
                  //   //       xValueMapper: (Datas data, _) {
                  //   //         if (provider.minutes != null || provider.hour != null) {
                  //   //           var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(data.times!, true);
                  //   //           var n = DateFormat("HH:mm:ss").format(date.toLocal());
                  //   //           return n;
                  //   //         } else {
                  //   //           var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(data.times!, true);
                  //   //           var n = DateFormat("MM-dd HH:mm:ss").format(date.toLocal());
                  //   //           return n;
                  //   //         }
                  //   //       },
                  //   //       yValueMapper: (Datas data, _) => data.val,
                  //   //       name: 'Telemetry',
                  //   //       enableTooltip: true,
                  //   //       animationDuration: 2500,
                  //   //       width: 1,
                  //   //       // Enable data label
                  //   //       dataLabelSettings: DataLabelSettings(isVisible: false))
                  //   // ],
                  // ),
                  SfRadialGauge(
                    title: GaugeTitle(
                        text: provider.studentList!.last.studentData!.age!,
                        textStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0, maximum: 14, pointers: <GaugePointer>[
                        NeedlePointer(value: double.parse(provider.studentList!.last.studentData!.age!), enableAnimation: true)
                      ], ranges: <GaugeRange>[
                        GaugeRange(startValue: 0, endValue: 5, color: Colors.green),
                        GaugeRange(startValue: 5, endValue: 10, color: Colors.orange),
                        GaugeRange(startValue: 10, endValue: 14, color: Colors.red)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Text(
                              '${provider.studentList!.last.studentData!.age!} MPH',
                              style:
                              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(provider.studentList!.last.studentData!.name.toString(), style: TextStyle(fontSize: 20),),
                            SizedBox(height: 8,),
                            Text('${provider.studentList!.last.studentData!.age.toString()} MPH', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      );
                    },
                    itemCount: 1,
                  ),
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
