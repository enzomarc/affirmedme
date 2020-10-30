import 'package:flutter/material.dart';

// ignore: camel_case_types
class Objectif_Container extends StatelessWidget {
  const Objectif_Container({
    Key key,
    this.title,
    this.count,
    this.countColor = const Color(0xFFFE0000),
  }) : super(key: key);

  final String title;
  final int count;
  final Color countColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              height: 100.0,
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
              margin: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              width: 100.0,
            ),
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: countColor,
                borderRadius: BorderRadius.circular(500.0),
              ),
              child: Center(
                child: Text(
                  count ?? '0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          title ?? 'Goal',
          style: TextStyle(
            fontFamily: 'MontBold',
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
