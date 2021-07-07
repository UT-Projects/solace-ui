import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Log In'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(children: [
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
            onChanged: (String newPassword) => setState(() {
              email = newPassword;
            }),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
            child: Text('Sign In'),
          ),
        ]),
      ),
    );
  }
}
