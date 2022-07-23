
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/i_login_professor_model.dart';
import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';


abstract class ILoginProfessorRepository{
  Future<Either<CommonErrors,ILoginProfessorModel>> login({required String cpf,required String hospital});
}