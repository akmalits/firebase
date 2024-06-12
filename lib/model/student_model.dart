class Student {
  String? key;
  StudentData? studentData;

  Student({this.key, this.studentData});
}

class StudentData {
  String? age;
  String? name;
  String? subject;
  dynamic timestamp;

  StudentData({this.age, this.name, this.subject, this.timestamp});

  StudentData.fromJson(Map<dynamic, dynamic> json) {
    age = json['age'];
    name = json['name'];
    subject = json['subject'];
    timestamp = json['timestamp'];
  }
}
