import 'package:deferred_teste/app/core/consts/routes.dart';
import 'package:deferred_teste/app/presenter/pages/home_page/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../other_page/other_page.dart';
import 'package:flutter/material.dart';
import '../../../deferred_class.dart' deferred as deferred_lazy;
import 'dart:math' deferred as math;
import 'package:get/get.dart' deferred as getx
    show GetX, GetBuilder, GetConnect, GetMaterialApp;

class HomePage extends StatelessWidget {
  final HomeController controller = Modular.get();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: controller as Listenable,
              builder: (context, widget) {
                if (!controller.lazyIsLoaded && !controller.isLoading) {
                  const Text("Without lazy call");
                }

                if (controller.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (!controller.isLoading && controller.lazyIsLoaded) {
                  return const Text("Lazy loaded");
                }
                return Container();
              }),
          const Divider(
            color: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text("Start Lazy Loading")),
              const VerticalDivider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                  onPressed: () => Modular.to.pushNamed(Routes.otherPage),
                  child: const Text("To other page"))
            ],
          ),
        ],
      ),
    );
  }

  void _onPressed() async {
    controller.isLoading = true;
    await math.loadLibrary();
    await deferred_lazy.loadLibrary();
    await getx.loadLibrary();
    controller.isLoading = false;
    controller.lazyIsLoaded = true;

    deferred_lazy.Deferred().lazy("Hello World");
  }
}
