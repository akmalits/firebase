class Sensor {
  String? key;
  SensorData? sensorData;

  Sensor({this.key, this.sensorData});
}

class SensorData {
  String? deviceId;
  String? ph;
  String? temp;
  String? humidity;
  dynamic timestamp;

  SensorData(
      {this.deviceId, this.ph, this.temp, this.humidity, this.timestamp});

  SensorData.fromJson(Map<dynamic, dynamic> json) {
    deviceId = json['deviceId'];
    ph = json['pH'];
    temp = json['temp'];
    humidity = json['humidity'];
    timestamp = json['timestamp'];
  }
}
