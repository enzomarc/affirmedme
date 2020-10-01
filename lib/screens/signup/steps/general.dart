import 'package:flutter/material.dart';

Step generalStep = Step(
  title: const Text('General'),
  isActive: true,
  content: Form(
    child: Column(
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            fontFamily: 'Montserrat Bold',
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 20.0),
        TextFormField(),
      ],
    ),
  ),
);
