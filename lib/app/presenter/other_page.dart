import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart' deferred as getx
    show GetX, GetBuilder, GetConnect, GetMaterialApp;
import 'package:bloc/bloc.dart' deferred as bloc;
import 'package:google_ml_kit/google_ml_kit.dart' deferred as mlkit
    show
        AddressEntity,
        BarcodeAddress,
        BarcodeDriverLicense,
        Barcode,
        Entity,
        Label,
        Pose,
        InputImagePlaneMetadata;

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Modular.to.pop(), child: const Text("Voltar")),
            const VerticalDivider(
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: _onPressed, child: const Text("Start Lazy Loading"))
          ],
        ),
      ),
    );
  }

  void _onPressed() async {
    await mlkit.loadLibrary();
    await getx.loadLibrary();
    await bloc.loadLibrary();
    mlkit.Entity("");
  }
}
