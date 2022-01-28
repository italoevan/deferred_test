import 'package:flutter/cupertino.dart';
import '../../../deferred_class.dart' deferred as deferred_lazy;
import 'dart:math' deferred as math;
import 'package:get/get.dart' deferred as getx
    show GetX, GetBuilder, GetConnect, GetMaterialApp;

abstract class HomeController {
  bool get isLoading;
  bool get lazyIsLoaded;
  set isLoading(bool value);
  set lazyIsLoaded(bool value);
  void onPressed();
}

class HomeControllerImpl extends ChangeNotifier implements HomeController {
  HomeControllerImpl();

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
    await math.loadLibrary();
    await deferred_lazy.loadLibrary();
    await getx.loadLibrary();
    isLoading = false;
    lazyIsLoaded = true;

    deferred_lazy.Deferred().lazy("Hello World");
  }
}
