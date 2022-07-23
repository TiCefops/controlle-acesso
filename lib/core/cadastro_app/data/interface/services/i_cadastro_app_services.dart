import '../entity/cadastro_app_entity.dart';

abstract class ICadastroAppServices {
  Future<CadastroAppEntity>cadastrar(CadastroAppEntity dados);
}