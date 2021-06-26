import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

Future<PatientInfo> getPatientInfo(String uuid) async {
  final response =
      await http.get(Uri.parse("http://localhost:3000/getUser?uuid=" + uuid));
  if (response.statusCode == 200) {
    return PatientInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to find patient");
  }
}

Future<String> createPatient(String name, DateTime birthdate, String email, String sex) async {
  var uuid = Uuid();
  String randomUuid = uuid.v4(); // v4?
  final response = await http.post(
    Uri.parse("http:.//localhost:3000/createUser"),
    body: jsonEncode(<String, String> {
      'uuid': randomUuid, 
      'name': name,
      'birthdate': birthdate.millisecondsSinceEpoch.toString(),
      'email': email,
      'sex': sex,
    }),
  );

  if (response.statusCode == 200) {
    return randomUuid;
  } else {
    throw Exception("Failed to create patient");
  }
  
}

class PatientInfo {
  final String uuid;
  final String name;
  final int birthdate;
  final String email;
  final String sex;

  PatientInfo({
    required this.uuid,
    required this.name,
    required this.birthdate,
    required this.email,
    required this.sex,
  });

  factory PatientInfo.fromJson(Map<String, dynamic> json) {
    return PatientInfo(
      name: json['Item']['name'] as String,
      birthdate: json['Item']['birthdate'] as int,
      uuid: json['Item']['uuid'] as String,
      email: json['Item']['email'] as String,
      sex: json['Item']['sex'] as String,
    );
  }
}
