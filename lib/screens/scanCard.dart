import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanCard extends StatefulWidget {
  @override
  _ScanCardState createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: _image == null
                ? Text(
                    'Scan a Business card',
                    style: TextStyle(
                      fontFamily: 'Montserrat SemiBold',
                      fontSize: 17.0,
                    ),
                  )
                : Image.file(_image),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Take a picture',
        backgroundColor: Color(0xFFFE0000),
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
