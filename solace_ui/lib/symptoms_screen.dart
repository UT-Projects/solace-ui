import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:solace_ui/redux/actions/actions.dart';
import 'package:solace_ui/redux/app_state.dart';

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
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView.builder(
          addRepaintBoundaries: true,
          scrollDirection: Axis.vertical,
          itemCount: _symptoms.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              Divider(
                thickness: 1,
              ),
              Symptom(symptomInfo: _symptoms[index]),
            ]);
          },
        ),
      ),
    );
  }
}

class Symptom extends StatefulWidget {
  final dynamic symptomInfo;
  Symptom({Key? key, required this.symptomInfo}) : super(key: key);

  @override
  _SymptomState createState() => _SymptomState();
}

class _SymptomState extends State<Symptom> {
  TextEditingController desc = TextEditingController();

  @override
  void initState() {
    super.initState();
    desc.text = widget.symptomInfo["description"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.symptomInfo["name"],
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "SFCompact",
                    color: Color(0xFF00A1A1),
                  ),
                ),
                Text(
                  widget.symptomInfo["type"],
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "SFCompact",
                    color: Color(0xFF979797),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      border: InputBorder.none,
                    ),
                    minLines: 3,
                    maxLines: 3,
                    readOnly: true,
                    controller: desc,
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: "SFPro",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SelectButton(symptom: widget.symptomInfo["name"]),
        ],
      ),
    );
  }
}

class SelectButton extends StatefulWidget {
  final String symptom;

  const SelectButton({Key? key, required this.symptom}) : super(key: key);

  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool selected = false;

  Color getTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return selected || states.any(interactiveStates.contains)
        ? Colors.white
        : Color(0xFF80D7EB);
  }

  Color getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return selected || states.any(interactiveStates.contains)
        ? Color(0xFF80D7EB)
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(selected ? "Remove" : "Select",
          style: TextStyle(
            fontSize: 13,
            fontFamily: "SFPro",
          )),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
        backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
        minimumSize: MaterialStateProperty.all(Size(93, 22)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Color(0xFF80D7EB)),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: () {
        setState(() {
          selected ^= true;
          if (selected)
            StoreProvider.of<AppState>(context)
                .dispatch(AddSymptom(widget.symptom));
          else
            StoreProvider.of<AppState>(context)
                .dispatch(RemoveSymptom(widget.symptom));
        });
      },
    );
  }
}
