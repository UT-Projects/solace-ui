import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstname = "";
  String lastname = "";
  DateTime birthdate = DateTime.now();
  String sex = "";
  String ethnicity = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,20,20,20),
      child: Column(children: [
        Text("First Name"),
        Divider(thickness: 1),
        Text("Last Name"),
        Divider(thickness: 1),
        Text("DOB"),
        Divider(thickness: 1),
        Text("Sex"),
        Divider(thickness: 1),
        Text("Race/Ethnicity"),
        Divider(thickness: 1),
        Text("Email"),
      ]),
    );
  }
}