import 'package:cefops_controll_acess/core/cadastro_app/data/interface/provider/i_cadastro_app_provider.dart';
import 'package:cefops_controll_acess/core/login_app/services/login_app_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../interface/entity/cadastro_app_entity.dart';
import '../interface/services/i_cadastro_app_services.dart';

class CadastroAppServiceImpl implements ICadastroAppServices {
  final ICadastroAppProvider provider;
  CadastroAppServiceImpl(this.provider);

  @override
  Future<CadastroAppEntity> cadastrar(CadastroAppEntity dados) async {
    final AuthenticationHelper authHelper = AuthenticationHelper(auth: FirebaseAuth.instance);
    await authHelper.signUp(email: dados.email, password: dados.password).then((value) async {
      await provider.cadastrar(dados);
      print(value);
    });

  }

}