import 'package:cloud_firestore/cloud_firestore.dart';

import '../interface/entity/assinatura_aluno_enity.dart';
import '../interface/provider/i_assinatura_aluno_provider.dart';

class AssinaturaAlunoProvider implements IAssinaturaAlunoProvider {
  final FirebaseFirestore firestore;

  AssinaturaAlunoProvider({required this.firestore});

  @override
  Future<void> assinarChamada(
      {required AssinaturaAlunoEntity assinatura}) async {
    final CollectionReference aluno = firestore.collection('Alunos');
    final assinaturaRef =
        aluno.doc(assinatura.alunoId).collection("assinaturas");
    await assinaturaRef.add({
      "assinatura": assinatura.assinaturaAluno,
      "tipo": assinatura.tipoEntrada,
      "horaAssinatura": assinatura.horaAssinatura,
      "horaCadastro": Timestamp.now().toString(),
      "hospital":{
        "id": assinatura.hospitalId,
        "hora":assinatura.horaAssinatura,
      }
    }).then((value) => assinaturaRef.doc(value.id).update({"id": value.id}));
  }
}
