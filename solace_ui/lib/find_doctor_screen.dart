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
      child: Center(
        child: Column(children: [
          Text(
            "Find a Doctor",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 35),
          Text(
            "What are your symptoms?",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => OpeningScreen())),
            child: Text("Choose your symptoms"),
          ),
          SizedBox(height: 125),
          Text(
            "Physician Preference",
            style: TextStyle(fontSize: 16),
          ),
          // PhysicianPreference(), FIX
        ]),
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
    return new ListView.builder(
      itemCount: buttonData.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                buttonData.forEach((element) => element.isSelected = false);
                buttonData[index].isSelected = true;
              });
            },
            child: new RadioItem(buttonData[index]));
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
          height: 50.0,
          width: 50.0,
          child: Center(
            child: Text(
              _item.buttonText,
              style: TextStyle(
                color: _item.isSelected ? Colors.white : Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
            border: Border.all(
              width: 1.0,
              color: _item.isSelected ? Colors.blueAccent : Colors.grey,
            ),
            borderRadius:  const BorderRadius.all(const Radius.circular(2.0))
          ),
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
