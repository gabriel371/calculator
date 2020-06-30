import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color color;
  final String text;
  final int flex;
  final VoidCallback onPressed;

  CalcButton({
    this.color = Colors.black,
    @required this.text,
    this.flex = 1,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   flex: flex,
    //   child: MaterialButton(
    //     color: color,
    //     padding: EdgeInsets.all(0),
    //     onPressed: onPressed,
    //     child: Container(
    //       child: Center(
    //         child: Text(
    //           text,
    //           style: TextStyle(
    //             fontSize: 40,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //       height: MediaQuery.of(context).size.height * 0.15,
    //       width: double.infinity,
    //     ),
    //   ),
    // );
    return Expanded(
      flex: flex,
      child: FlatButton(
        color: Colors.white,
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
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
