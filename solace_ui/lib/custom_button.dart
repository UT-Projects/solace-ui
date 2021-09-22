import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color primColor;
  final Size size;
  final double fontSize;
  final String fontFamily;
  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.primColor = const Color(0xFF00A1A1),
      this.size = const Size(250, 51),
      this.fontSize = 24,
      this.fontFamily = "SFPro"})
      : super(key: key);

  Color getTextColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return states.any(interactiveStates.contains)
        ? Colors.white
        : primColor;
  }

  Color getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return states.any(interactiveStates.contains) ? primColor : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
          style: TextStyle(
            fontSize: this.fontSize,
            fontFamily: this.fontFamily,
          )),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
        backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
        fixedSize: MaterialStateProperty.all(size),
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
