import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  const Goal({
    Key key,
    this.assetImage,
    this.title,
    this.count,
    this.countColor = const Color(0xFFFE0000),
  }) : super(key: key);

  final String assetImage;
  final String title;
  final int count;
  final Color countColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/goals/add');
      },
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                padding: EdgeInsets.all(5.0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(assetImage ?? 'assets/images/relationships.png'),
                  ],
                ),
              ),
              Container(
                width: 18.0,
                height: 18.0,
                decoration: BoxDecoration(
                  color: countColor,
                  borderRadius: BorderRadius.circular(500.0),
                ),
                child: Center(
                  child: Text(
                    count.toString() ?? '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
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
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
