
import '../../../../../core/erros/common_errors.dart';
import '../model/i_listar_turmas_entity.dart';
import 'package:either_dart/either.dart';

abstract class IListarTurmasProvider{
  Future<Either<CommonErrors,List<IListarTurmasEntity>>> buscarTodasAsTurmas({required String idTurma});
}