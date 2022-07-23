


import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';
import '../model/i_listar_turmas_entity.dart';

abstract class IListarTurmasService{
  Future<Either<CommonErrors,List<IListarTurmasEntity>>> buscarTodasAsTurmas({required String idProfessor});

}