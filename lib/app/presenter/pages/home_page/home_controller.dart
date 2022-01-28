import 'package:flutter/cupertino.dart';

abstract class HomeController {
  bool get isLoading;
  bool get lazyIsLoaded;
  set isLoading(bool value);
  set lazyIsLoaded(bool value);
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
}
