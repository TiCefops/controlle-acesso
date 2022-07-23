import 'package:cefops_controll_acess/controle_acesso/modulo_acesso.dart';
import 'package:cefops_controll_acess/core/login_app/pages/login_app_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../admin/modulo_adm.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginAppPage()),
        ModuleRoute('/controle_acesso',
            module: ModuloAcesso(), transition: TransitionType.noTransition),
        ModuleRoute('/adm',
            module: ModuloAdm(), transition: TransitionType.noTransition),
      ];
}
