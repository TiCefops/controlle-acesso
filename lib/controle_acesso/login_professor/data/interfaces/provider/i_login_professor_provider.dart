import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';
import '../model/i_login_professor_model.dart';

abstract class ILoginProfessorProvider{
  Future<Either<CommonErrors,ILoginProfessorModel>> login({required String cpf,required String hospital});
}