import 'package:flutter/material.dart';

// ignore: camel_case_types
class Tasks_Container extends StatefulWidget {
  const Tasks_Container({
    Key key,
    @required this.taskname,
    this.taskcolor,
  }) : super(key: key);

  final String taskname;
  final Color taskcolor;

  @override
  _Tasks_ContainerState createState() => _Tasks_ContainerState();
}

// ignore: camel_case_types
class _Tasks_ContainerState extends State<Tasks_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      padding: EdgeInsets.all(10.0),
      height: 90.0,
      width: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: widget.taskcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Text(
        widget.taskname,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25.0,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
