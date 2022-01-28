import 'package:deferred_teste/app/core/consts/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'other_page.dart';
import 'package:flutter/material.dart';
import '../deferred_class.dart' deferred as deferred_lazy;
import 'dart:math' deferred as math;
import 'package:get/get.dart' deferred as getx
    show GetX, GetBuilder, GetConnect, GetMaterialApp;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _onPressed, child: const Text("Start Lazy Loading")),
            const VerticalDivider(
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () => Modular.to.pushNamed(Routes.otherPage),
                child: const Text("To other page"))
          ],
        ),
      ),
    );
  }

  void _onPressed() async {
    await math.loadLibrary();
    await deferred_lazy.loadLibrary();
    await getx.loadLibrary();

    deferred_lazy.Deferred().lazy("Hello World");
  }
}
