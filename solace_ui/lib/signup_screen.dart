import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:solace_ui/redux/actions/actions.dart';
import 'package:solace_ui/redux/app_state.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  DateTime birthdate = DateTime.now();
  String sex = "Prefer Not to Answer";
  String ethnicity = "Prefer Not to Answer";

  updateBirthdate(DateTime date) {
    setState(() {
      birthdate = date;
    });
  }

  updateSex(String newSex) {
    setState(() {
      sex = newSex;
    });
  }

  updateEthnicity(String newEthnicity) {
    setState(() {
      ethnicity = newEthnicity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Create an Account'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                onChanged: (String newEmail) => setState(() {
                  email = newEmail;
                }),
              ),
              Divider(),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                onChanged: (String newPass) => setState(() {
                  password = newPass;
                }),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'First Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12.0),
                  ),
                ),
                onChanged: (String newFName) => setState(() {
                  firstName = newFName;
                }),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Last Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12.0),
                  ),
                ),
                onChanged: (String newLName) => setState(() {
                  lastName = newLName;
                }),
              ),
              Divider(),
              BirthdateField(updateBirthdate: updateBirthdate),
              Divider(),
              SelectSexDropdown(updateSex: updateSex),
              Divider(),
              SelectEthnicityDropdown(updateEthnicity: updateEthnicity),
              Divider(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen())),
                  StoreProvider.of<AppState>(context).dispatch(CreateUserAction(
                    firstName: firstName, lastName: lastName, email: email, 
                    birthdate: birthdate, sex: sex, ethnicity: ethnicity)),
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BirthdateField extends StatefulWidget {
  final Function updateBirthdate;
  BirthdateField({Key? key, required this.updateBirthdate}) : super(key: key);

  @override
  _BirthdateFieldState createState() => _BirthdateFieldState();
}

class _BirthdateFieldState extends State<BirthdateField> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        controller: dateController,
        decoration: InputDecoration(
          labelText: 'Birthdate',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
          ),
        ),
        onTap: () async {
          var date = await showDatePicker(
              context: context,
              initialDate: DateTime(1970),
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          if (date != null) {
            final DateFormat formatter = DateFormat('MMM d, y');
            dateController.text = formatter.format(date);
            widget.updateBirthdate(date);
          }
        });
  }
}

class SelectSexDropdown extends StatefulWidget {
  final Function updateSex;
  const SelectSexDropdown({Key? key, required this.updateSex})
      : super(key: key);

  @override
  State<SelectSexDropdown> createState() => _SelectSexDropdownState();
}

class _SelectSexDropdownState extends State<SelectSexDropdown> {
  String _currentSex = "Prefer not to answer";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Sex',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
          ),
        ),
        value: _currentSex,
        onChanged: (String? newValue) {
          setState(() {
            _currentSex = newValue!;
          });
          widget.updateSex(newValue);
        },
        items: <String>['Male', 'Female', 'Prefer not to answer']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}

class SelectEthnicityDropdown extends StatefulWidget {
  final Function updateEthnicity;
  const SelectEthnicityDropdown({Key? key, required this.updateEthnicity}) : super(key: key);

  @override
  State<SelectEthnicityDropdown> createState() =>
      _SelectEthnicityDropdownState();
}

class _SelectEthnicityDropdownState extends State<SelectEthnicityDropdown> {
  String _currentEthnicity = "Prefer not to answer";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Race/Ethnicity',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
          ),
        ),
        value: _currentEthnicity,
        onChanged: (String? newValue) {
          setState(() {
            _currentEthnicity = newValue!;
          });
          widget.updateEthnicity(newValue);
        },
        items: <String>[
          'American Indian or Alaskan Native',
          'Asian',
          'Black or African American',
          'Hispanic or Latino',
          'White',
          'Native Hawaiian or Pacific Islander',
          'Unsure',
          'Prefer not to answer'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
