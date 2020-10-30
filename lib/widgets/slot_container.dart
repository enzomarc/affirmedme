import 'package:flutter/material.dart';

// ignore: camel_case_types
class Slot_Container extends StatelessWidget {
  const Slot_Container({
    Key key,
    this.day,
    this.containerContent,
  }) : super(key: key);

  final String day;
  final String containerContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Mon',
          style: TextStyle(
            fontFamily: 'MontBold',
            fontSize: 10.0,
            color: Color(0xFFFE0000),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
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
            'data',
            style: TextStyle(
              fontFamily: 'MontRegular',
              color: Color(0xFFFE0000),
            ),
          ),
        )
      ],
    );
  }
}
