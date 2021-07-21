import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        widget.text,
        style: TextStyle (
          fontSize: 24,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF00A1A1),
        minimumSize: Size(250, 51),
        textStyle: TextStyle(fontSize: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Color(0xFF00A1A1)),
        ),
      ),
      onTap: () {

      },
      onPressed: () {
        widget.onPressed();
      },  
    )
  }
}