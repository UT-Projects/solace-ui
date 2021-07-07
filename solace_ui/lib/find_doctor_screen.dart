import 'package:flutter/material.dart';

import 'opening_screen.dart';

class FindDoctorScreen extends StatefulWidget {
  FindDoctorScreen({Key? key}) : super(key: key);

  @override
  _FindDoctorScreenState createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(children: [
        Text("Find a Doctor"),
        Divider(),
        Text("What are your symptoms?"),
        ElevatedButton(
          onPressed: () => Navigator.push(context, 
            MaterialPageRoute(builder: (context) => OpeningScreen())),
          child: Text("Choose your symptoms"),
        ),
        Divider(),
        Text("Physician Preference"),

      ]),
    );
  }
}