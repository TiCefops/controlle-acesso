
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/i_login_professor_model.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/repository/i_login_professor_repository.dart';
import 'package:cefops_controll_acess/core/erros/common_errors.dart';
import 'package:either_dart/src/either.dart';

class LoginProfessorRepositoryImpl implements ILoginProfessorRepository{
  @override
  Future<Either<CommonErrors, ILoginProfessorModel>> login({required String cpf}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}