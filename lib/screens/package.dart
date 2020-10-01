import 'package:flutter/material.dart';

class PackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFFFE0000),
        ),
        title: Text(
          'Package',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select your package',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'You have make a choice between the both packages. The premium package give you all features of the app and with basic package you will have a few part of features.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PackageItem(icon: Icons.receipt, title: 'Basic'),
                  PackageItem(icon: Icons.monetization_on, title: 'Premium'),
                ],
              ),
              SizedBox(height: 80.0),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 15.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                color: Color(0xFFFE0000),
                child: Text(
                  'Next Step',
                  style: TextStyle(
                    fontFamily: 'Montserrat Medium',
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PackageItem extends StatefulWidget {
  const PackageItem({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  _PackageItemState createState() => _PackageItemState();
}

class _PackageItemState extends State<PackageItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 130.0,
        width: 150.0,
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: selected ? Color(0xFFFE0000) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: selected ? Colors.white : Color(0xFFFE0000),
              size: 60.0,
            ),
            SizedBox(height: 5.0),
            Text(
              widget.title ?? '',
              style: TextStyle(
                color: selected ? Colors.white : Color(0xFFFE0000),
                fontFamily: 'Montserrat Medium',
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
