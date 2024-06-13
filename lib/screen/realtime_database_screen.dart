import 'package:fireeeee/model/sensor_model.dart';
import 'package:fireeeee/provider/realtime_database_sensor_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RealTimeDatabase extends StatelessWidget {
  static const routeName = '/realtime_database_stless';

  const RealTimeDatabase({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: RealTimeDatabaseProviderSensor(),
      child: Consumer<RealTimeDatabaseProviderSensor>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Realtime Database'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SfRadialGauge(
                          title: const GaugeTitle(
                              text: 'pH Meter',
                              textStyle: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          enableLoadingAnimation: true,
                          animationDuration: 4500,
                          axes: <RadialAxis>[
                            RadialAxis(
                                minimum: 0,
                                maximum: 14,
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      value: provider.sensorList!.isEmpty
                                          ? 0.0
                                          : double.parse(provider.sensorList!
                                              .last.sensorData!.ph!),
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
                                      startValue: 10,
                                      endValue: 14,
                                      color: Colors.red)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Text(
                                        '${provider.sensorList!.isEmpty ? '' : provider.sensorList!.last.sensorData!.ph!} pH',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      positionFactor: 0.5,
                                      angle: 90)
                                ])
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SfRadialGauge(
                          title: const GaugeTitle(
                              text: 'Temperature Meter',
                              textStyle: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          enableLoadingAnimation: true,
                          animationDuration: 4500,
                          axes: <RadialAxis>[
                            RadialAxis(
                                minimum: -75,
                                maximum: 75,
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      value: provider.sensorList!.isEmpty
                                          ? 0.0
                                          : double.parse(provider.sensorList!
                                              .last.sensorData!.temp!),
                                      enableAnimation: true)
                                ],
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                      startValue: -75,
                                      endValue: -25,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: -25,
                                      endValue: 25,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: 25,
                                      endValue: 75,
                                      color: Colors.red)
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Text(
                                        '${provider.sensorList!.isEmpty ? '' : provider.sensorList!.last.sensorData!.temp!} °C',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      positionFactor: 0.5,
                                      angle: 90)
                                ])
                          ],
                        ),
                      ),
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${provider.sensorList!.isEmpty ? '' : provider.sensorList!.last.sensorData!.ph.toString()} pH',
                                        style: const TextStyle(fontSize: 18)),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        provider.sensorList!.isEmpty
                                            ? ''
                                            : DateFormat("HH:mm:ss dd-MM-yyyy")
                                                .format(DateFormat(
                                                        "yyyy-MM-ddTHH:mm:ss")
                                                    .parse(
                                                        provider
                                                            .sensorList!
                                                            .last
                                                            .sensorData!
                                                            .timestamp
                                                            .toString(),
                                                        true)),
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${provider.sensorList!.isEmpty ? '' : provider.sensorList!.last.sensorData!.temp.toString()} °C',
                                        style: const TextStyle(fontSize: 18)),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        provider.sensorList!.isEmpty
                                            ? ''
                                            : DateFormat("HH:mm:ss dd-MM-yyyy")
                                                .format(DateFormat(
                                                        "yyyy-MM-ddTHH:mm:ss")
                                                    .parse(
                                                        provider
                                                            .sensorList!
                                                            .last
                                                            .sensorData!
                                                            .timestamp
                                                            .toString(),
                                                        true)),
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
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
                      title: const ChartTitle(text: 'pH Data Chart'),
                      // Enable legend
                      legend: const Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<Sensor, String>>[
                        LineSeries<Sensor, String>(
                            dataSource: provider.sensorList!,
                            xValueMapper: (Sensor sensor, _) {
                              final timestampString =
                                  sensor.sensorData!.timestamp;
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
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ]),
                  SfCartesianChart(
                      primaryXAxis: const CategoryAxis(
                        title: AxisTitle(text: 'Time'),
                      ),
                      // Chart title
                      title: const ChartTitle(
                          text: 'Temperature Data Chart'),
                      // Enable legend
                      legend: const Legend(isVisible: true),

                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<Sensor, String>>[
                        LineSeries<Sensor, String>(
                            dataSource: provider.sensorList!,
                            xValueMapper: (Sensor sensor, _) {
                              final timestampString =
                                  sensor.sensorData!.timestamp;
                              if (timestampString != null) {
                                final date = DateFormat("yyyy-MM-ddTHH:mm:ss")
                                    .parse(timestampString, true);
                                return DateFormat("HH:mm:ss").format(date);
                              }
                              return '';
                            },
                            yValueMapper: (Sensor sensor, _) => double.parse(
                                sensor.sensorData!.temp.toString()),
                            name: 'Temperature',
                            color: Colors.red,
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
}
