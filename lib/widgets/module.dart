import 'package:flutter/material.dart';

class Module extends StatelessWidget {
  const Module({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      width: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title ?? 'Module',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat Medium',
              fontSize: 14.0,
              color: Color(0xFFFE0000),
            ),
          ),
        ],
      ),
    );
  }
}
