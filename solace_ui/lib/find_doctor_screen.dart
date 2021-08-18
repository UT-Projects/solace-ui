import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:solace_ui/custom_button.dart';
import 'package:solace_ui/redux/actions/actions.dart';
import 'package:solace_ui/symptoms_screen.dart';
import 'opening_screen.dart';
import 'redux/app_state.dart';

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
      child: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 35),
            Text(
              "Find a Doctor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35),
            Text(
              "What are your symptoms?",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 15),
            CustomButton(
              text: "Choose your symptoms", 
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SymptomsScreen())),
              primColor: Color(0xFF80D7EB),
              size: Size(244, 36),
              fontFamily: "SFCompact",
              fontSize: 15,
            ),
            SizedBox(height: 15),
            SymptomListButtons(),
            SizedBox(height: 40),
            Text(
              "Physician Preference",
              style: TextStyle(fontSize: 15),
            ),
            PhysicianPreference(),
            SizedBox(height: 15),
            Text("Any additional notes for your physician?",
                style: TextStyle(fontSize: 15)),
            SizedBox(height: 15),
            Container(
              height: 94,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                expands: true,
                maxLines: null,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 69,
              child: Center(
                child: Text(
                  "If this is a Medical Emergency, please exit this app and call local medical authorities immediately.",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFE79A65),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FindDoctorScreen())),
              },
              text: "Submit",
            ),
          ]),
        ),
      ),
    );
  }
}

class SymptomListButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<String>>(
      converter: (store) => store.state.symptoms.symptomList.toList(),
      builder: (BuildContext context, List<String> symptomList) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Wrap(
            runSpacing: 5,
            spacing: 5,
            direction: Axis.horizontal,
            children: List<Widget>.generate(symptomList.length, (index) => 
              SymptomButton(symptomList[index])),
          ),
        );
      },
    );
  }
}

class SymptomButton extends StatelessWidget {
  final String symptom;
  SymptomButton(this.symptom);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 27,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Row(
            children: [
              Text(
                symptom,
                style: TextStyle(fontSize: 14, fontFamily: "SFPro"),
              ),
              Container(
                width: 25,
                child: TextButton(
                  onPressed: () => StoreProvider.of<AppState>(context).dispatch(RemoveSymptom(symptom)),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Color(0xFFE79A65),
                    size: 20,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhysicianPreference extends StatefulWidget {
  PhysicianPreference({Key? key}) : super(key: key);

  @override
  _PhysicianPreferenceState createState() => _PhysicianPreferenceState();
}

class _PhysicianPreferenceState extends State<PhysicianPreference> {
  List<RadioModel> buttonData = [];

  @override
  void initState() {
    super.initState();
    buttonData.add(new RadioModel(false, 'Male'));
    buttonData.add(new RadioModel(false, 'Female'));
    buttonData.add(new RadioModel(false, 'No Preference'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonData.length,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                setState(() {
                  buttonData.forEach((element) => element.isSelected = false);
                  buttonData[index].isSelected = true;
                });
              },
              child: new RadioItem(buttonData[index]),
            ),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
          height: 71,
          width: 85,
          child: Center(
            child: Text(
              _item.buttonText,
              style: TextStyle(
                color: _item.isSelected ? Colors.white : Colors.black,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
              color: _item.isSelected ? Color(0xFF80D7EB) : Colors.transparent,
              border: Border.all(
                width: 1.0,
                color: _item.isSelected ? Color(0xFF80D7EB) : Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ]),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
