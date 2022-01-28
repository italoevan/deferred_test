import 'package:deferred_teste/app/core/consts/routes.dart';
import 'package:deferred_teste/app/presenter/pages/home_page/home_controller.dart';
import 'package:deferred_teste/app/presenter/pages/home_page/home_page.dart';
import 'package:deferred_teste/app/presenter/pages/other_page/other_controller.dart';
import 'package:deferred_teste/app/presenter/pages/other_page/other_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [Bind((i) => HomeControllerImpl()), Bind((i) => OtherControllerImpl())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.root,
            child: (conttext, args) => HomePage(),
            transition: TransitionType.noTransition),
        ChildRoute(Routes.otherPage,
            child: (context, args) => OtherPage(),
            transition: TransitionType.noTransition)
      ];
}
