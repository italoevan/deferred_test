import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' deferred as getx
    show GetX, GetBuilder, GetConnect, GetMaterialApp;
import 'package:bloc/bloc.dart' deferred as bloc;
import 'package:google_ml_vision/google_ml_vision.dart' deferred as mlVision;
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

abstract class OtherController {
  bool get isLoading;
  bool get lazyIsLoaded;
  set isLoading(bool value);
  set lazyIsLoaded(bool value);
  void onPressed();
}

class OtherControllerImpl extends ChangeNotifier implements OtherController {
  OtherControllerImpl();

  bool _isLoading = false;

  bool _lazyIsLoaded = false;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get lazyIsLoaded => _lazyIsLoaded;

  @override
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  set lazyIsLoaded(bool value) {
    _lazyIsLoaded = value;
    notifyListeners();
  }

  @override
  void onPressed() async {
    isLoading = true;
    await mlkit.loadLibrary();
    await getx.loadLibrary();
    await bloc.loadLibrary();
    await mlVision.loadLibrary();
    mlkit.Entity("");
    isLoading = false;
    lazyIsLoaded = true;
  }
}
