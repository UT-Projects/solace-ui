import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color primColor;
  final Size size;
  CustomButton({Key? key, required this.text, required this.onPressed, 
  this.primColor = const Color(0xFF00A1A1), this.size = const Size(250, 51)})
      : super(key: key);

  Color getTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return states.any(interactiveStates.contains)
        ? Colors.white
        : Color(0xFF00A1A1);
  }

  Color getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return states.any(interactiveStates.contains)
        ? primColor
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
          style: TextStyle(
            fontSize: 24,
            fontFamily: "SFPro",
          )),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
        backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
        minimumSize: MaterialStateProperty.all(size),
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: primColor),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
