import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import 'login_screen.dart';
import 'redux/app_state.dart';

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
    return StoreConnector<AppState, UserInfo>(
      converter: (store) => store.state.userInfo,
      builder: (BuildContext context, UserInfo userInfo) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
              OneUserInfo("First Name", userInfo.firstName),
              SizedBox(height: 7),
              Divider(thickness: 1),
              SizedBox(height: 7),
              OneUserInfo("Last Name", userInfo.lastName),
              SizedBox(height: 7),
              Divider(thickness: 1),
              SizedBox(height: 7),
              OneUserInfo("Birthdate", DateFormat('MM/dd/yyyy').format(userInfo.birthdate)),
              SizedBox(height: 7),
              Divider(thickness: 1),
              SizedBox(height: 7),
              OneUserInfo("Sex", userInfo.sex),
              SizedBox(height: 7),
              Divider(thickness: 1),
              SizedBox(height: 7),
              OneUserInfo("Race/Ethnicity", userInfo.ethnicity),
              SizedBox(height: 7),
              Divider(thickness: 1),
              SizedBox(height: 7),
              OneUserInfo("Email", userInfo.email),
              SizedBox(height: 7),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen())),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "SFCompact",
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFE79A65)),
                    minimumSize: MaterialStateProperty.all(Size(91, 33)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Color(0xFFE79A65)),
                    )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OneUserInfo extends StatelessWidget {
  final String description;
  final String info;

  OneUserInfo(this.description, this.info);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: TextStyle(
            color: Color(0xFF5C5C5C),
            fontSize: 16,
            fontFamily: "SFCompact",
          ),
        ),
        SizedBox(height:5),
        Text(
          info,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "SFCompact",
          ),
        ),
      ],
    );
  }
}
