import 'package:deferred_teste/app/presenter/pages/other_page/other_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OtherPage extends StatefulWidget {
  final OtherController controller = Modular.get();
  OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: widget.controller as Listenable,
              builder: (context, wid) {
                if (!widget.controller.lazyIsLoaded &&
                    !widget.controller.isLoading) {
                  const Text("Without lazy call");
                }

                if (widget.controller.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (!widget.controller.isLoading &&
                    widget.controller.lazyIsLoaded) {
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
                  onPressed: () => Modular.to.pop(),
                  child: const Text("Voltar")),
              const VerticalDivider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                  onPressed: widget.controller.onPressed,
                  child: const Text("Start Lazy Loading"))
            ],
          ),
        ],
      ),
    );
  }
}
