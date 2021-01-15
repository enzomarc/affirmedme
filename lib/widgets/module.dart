import 'package:flutter/material.dart';

class Module extends StatelessWidget {
  const Module({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        padding: EdgeInsets.all(10.0),
        width: 70.0,
        height: 70.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title ?? 'Module',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat Medium',
                fontSize: 10.0,
                color: Color(0xFFFE0000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
