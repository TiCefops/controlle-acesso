
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/model/listar_turmas_model_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import '../../../../core/erros/common_errors.dart';
import '../interface/model/i_listar_turmas_entity.dart';
import '../interface/provider/i_listar_turmas_provider.dart';

class ListarTurmasProviderImpl implements IListarTurmasProvider{
  final FirebaseFirestore firestore;
  ListarTurmasProviderImpl({required this.firestore});


  @override
  Future<Either<CommonErrors, List<IListarTurmasEntity>>> buscarTodasAsTurmas({required String idTurma}) async {
    CollectionReference turma = firestore.collection("turmas");
    final turmas = await turma.where(
        "professores", arrayContains: idTurma).get();
    if ( turmas.docs.isNotEmpty){
      return Right(turmas.docs.map((e) {

        Map<String,dynamic> dados={
          "status":e.get("status"),
          "nome":e.get("nome"),
          "id": e.get("id")
        };

        return ListarTurmasModelImpl.fromJson(dados);
      }).toList()  );
    }else{
      CommonErrors erro=const CommonErrors(key:CommonErrorCode.notFound );
      return Left(erro);
    }
  }

}