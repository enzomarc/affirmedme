import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    this.label,
    this.icon,
    this.callback,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(200.0),
              ),
              padding: EdgeInsets.all(2.0),
              child: Icon(
                icon ?? Icons.add,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              label ?? 'New List',
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat Medium',
              ),
            ),
          ],
        ),
      ),
      onTap: callback,
    );
  }
}
