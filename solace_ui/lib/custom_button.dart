import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CustomButton({Key? key, required this.text, required this.onPressed})
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
        ? Color(0xFF00A1A1)
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "SFPro",
        )
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
        backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
        minimumSize: MaterialStateProperty.all(Size(250, 51)),
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Color(0xFF00A1A1)),
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
