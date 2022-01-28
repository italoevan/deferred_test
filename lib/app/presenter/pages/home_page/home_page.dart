import 'package:deferred_teste/app/core/consts/routes.dart';
import 'package:deferred_teste/app/presenter/pages/home_page/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

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
                  onPressed: controller.onPressed,
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
}
