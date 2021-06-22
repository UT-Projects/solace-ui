import "package:universal_html/html.dart" hide Navigator, Text;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:solace_ui/redux/actions/actions.dart';
import 'package:solace_ui/redux/app_state.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatelessWidget {
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
                onChanged: (email) => StoreProvider.of<AppState>(context)
                    .dispatch(UpdateSignupEmailAction(email)),
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
                onChanged: (password) => StoreProvider.of<AppState>(context)
                    .dispatch(UpdateSignupPasswordAction(password)),
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
                onChanged: (firstName) => StoreProvider.of<AppState>(context)
                    .dispatch(UpdateSignupFNameAction(firstName)),
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
                onChanged: (lastName) => StoreProvider.of<AppState>(context)
                    .dispatch(UpdateSignupLNameAction(lastName)),
              ),
              Divider(),
              BirthdateField(),
              Divider(),
              SelectSexDropdown(),
              Divider(),
              SelectEthnicityDropdown(),
              Divider(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen())),
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
  BirthdateField({Key? key}) : super(key: key);

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
            StoreProvider.of<AppState>(context)
                .dispatch(UpdateSignupBirthdateAction(date));
          }
        });
  }
}

class SelectSexDropdown extends StatefulWidget {
  const SelectSexDropdown({Key? key}) : super(key: key);

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
          StoreProvider.of<AppState>(context)
              .dispatch(UpdateSignupSexAction(newValue!));
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
  const SelectEthnicityDropdown({Key? key}) : super(key: key);

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
          StoreProvider.of<AppState>(context)
              .dispatch(UpdateSignupEthnicityAction(newValue!));
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
