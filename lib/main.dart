import 'package:flutter/material.dart';
import 'package:kronosme/core/affirmed.dart';
import 'package:kronosme/providers/module_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModuleProvider(),
        ),
      ],
      child: Affirmed(),
    ),
  );
}
