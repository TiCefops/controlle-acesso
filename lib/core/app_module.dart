import 'package:cefops_controll_acess/controle_acesso/login_app/pages/login_app_page.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/pages/login_professor_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>const LoginProfessorPage()),
  ];
}