import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;
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
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      child: ElevatedButton(
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
            fontSize: 24,
          )
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(getTextColor),
          backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
          minimumSize: MaterialStateProperty.all(Size(250, 51)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: Color(0xFF00A1A1)),
            ),
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        // style: ElevatedButton.styleFrom(
        //   primary: Colors.white,
        //   onPrimary: Color(0xFF00A1A1),
        //   minimumSize: Size(250, 51),
        //   textStyle: TextStyle(fontSize: 24),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //     side: BorderSide(color: Color(0xFF00A1A1)),
        //   ),
        //   splashFactory: InkRipple.splashFactory,
        // ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
