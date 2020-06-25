import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color color;
  final String text;
  final int flex;
  final VoidCallback onPressed;

  CalcButton({
    this.color = Colors.white,
    @required this.text,
    this.flex = 1,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: MaterialButton(
        color: color,
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
        ),
      ),
    );
  }
}
