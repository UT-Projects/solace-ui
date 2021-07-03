import 'package:flutter/material.dart';
import 'package:solace_ui/signup_screen.dart';
// import "package:universal_html/html.dart";

import 'login_screen.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container (
            height: 200,
            child: Image(image: AssetImage('lib/assets/slogo.jpg')),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen())
            ),
              child: Text('Log In'),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen())
            ),
            child: Text('New User'),
          ),
        ],
      ),
    );
  }
}
