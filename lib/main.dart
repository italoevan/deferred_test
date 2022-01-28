import 'package:deferred_teste/app/core/app_module.dart';
import 'package:deferred_teste/app/core/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}
