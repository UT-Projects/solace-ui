import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SymptomsScreen extends StatefulWidget {
  SymptomsScreen({Key? key}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  List _symptoms = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/symptoms.json');
    final data = await json.decode(response);
    setState(() {
      _symptoms = data["symptoms"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: ListView.builder(
        addRepaintBoundaries: true,
        scrollDirection: Axis.vertical,
        itemCount: _symptoms.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            Divider(
              thickness: 1,
            ),
            Symptom(_symptoms[index]),
          ]);
        },
      ),
    );
  }
}

class Symptom extends StatelessWidget {
  final dynamic symptomInfo;
  Symptom(this.symptomInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          symptomInfo["name"],
          style: TextStyle(
            fontSize: 15,
            fontFamily: "SFCompact"
          ),
        ),
      ],
    );

    //return Text(symptomId);
  }
}
