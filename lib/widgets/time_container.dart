import 'package:flutter/material.dart';

// ignore: camel_case_types
class Time_Container extends StatelessWidget {
  const Time_Container({
    Key key,
    @required this.hour,
  }) : super(key: key);

  final String hour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 5.0,
                )
              ],
            ),
            child: Text(
              hour,
              style: TextStyle(
                fontFamily: 'MontRegular',
                color: Color(0xFFFE0000),
                fontSize: 10.0
              ),
            ),
          )
        ],
      ),
    );
  }
}
