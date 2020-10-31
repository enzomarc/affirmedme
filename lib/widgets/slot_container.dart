import 'package:flutter/material.dart';

class DateSlot extends StatelessWidget {
  const DateSlot({
    Key key,
    this.day,
    this.label,
    this.active = false,
  }) : super(key: key);

  final String label;
  final int day;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label ?? 'Mon',
            style: TextStyle(
              fontFamily: 'Montserrat Bold',
              fontSize: 10.0,
              color: active ? Colors.white : Color(0xFFFE0000),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: active ? Color(0xFFFE0000) : Colors.white,
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
              day.toString() ?? '12',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xFFFE0000),
              ),
            ),
          )
        ],
      ),
    );
  }
}
