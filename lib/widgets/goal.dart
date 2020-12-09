import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  const Goal({
    Key key,
    this.icon,
    this.title,
    this.count,
    this.countColor = const Color(0xFFFE0000),
  }) : super(key: key);

  final IconData icon;
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
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon ?? Icons.accessible,
                    color: Color(0xFFFE0000),
                    size: 48.0,
                  ),
                ],
              ),
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
            fontFamily: 'Montserrat Bold',
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}