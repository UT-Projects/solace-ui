import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:solace_ui/redux/actions/actions.dart';

import 'redux/app_state.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors .black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Log In'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
              onChanged: (email) => StoreProvider.of<AppState>(context).dispatch(UpdateLoginEmailAction(email)),
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
              onChanged: (password) => StoreProvider.of<AppState>(context).dispatch(UpdateLoginPasswordAction(password)),
            ),
            Divider(),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen())
                ),
                child: Text('Sign In'),
            ),
          ]
        ),
      ),
    );
  }
}
