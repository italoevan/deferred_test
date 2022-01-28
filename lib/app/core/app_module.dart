import 'package:deferred_teste/app/core/consts/routes.dart';
import 'package:deferred_teste/app/presenter/home_page.dart';
import 'package:deferred_teste/app/presenter/other_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.root,
            child: (conttext, args) => const HomePage(),
            transition: TransitionType.noTransition),
        ChildRoute(Routes.otherPage,
            child: (context, args) => const OtherPage(),
            transition: TransitionType.noTransition)
      ];
}
