
import '../entity/assinatura_aluno_enity.dart';

abstract class IAssinaturaAlunoService {
  Future<void> assinarChamada(
      {required AssinaturaAlunoEntity assinatura});
}
